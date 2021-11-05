# -*- coding: utf-8 -*-
#
# Jaemok Jeong, 2013. 3. 27.

import itertools
import json
import re
import urllib
import alfred
import os

import sys
reload(sys)
sys.setdefaultencoding('utf-8')

url = 'https://itunes.apple.com/search'

MAX_RESULT = 15
COUNTRY = u'GB'

searchTerm = sys.argv[1:]

params = urllib.urlencode({
    'term' : searchTerm,
    'country' : COUNTRY,
    'media': u'music',
    'entity': u'musicArtist',
    # 'app': u'music',
    # 'uo': u'4',
    'limit' : MAX_RESULT,})

data = urllib.urlopen(url, params).read()
resultData = json.loads(data)['results']

results = []

results.append(alfred.Item(title=u"Search Apple Music for artists matching \"%s\"" % "".join(searchTerm),
                           subtitle=u"Search Apple Music",
                           attributes= {'uid':alfred.uid(0),
                                        'arg':u"itms://itunes.apple.com/WebObjects/MZStore.woa/wa/search?app=music&term=%s"% searchTerm[0] },
                           icon=u"icon.png"
                           ))

for (idx,e) in enumerate(itertools.islice(resultData, MAX_RESULT)):
    imageurl = u"icon.png"

    itmsLink = e['artistLinkUrl'].replace('https://','itms://') + u'&app=music'

    subtitle = "%s • %s" % (e['artistType'], e['primaryGenreName'])
    results.append(alfred.Item(title=e['artistName'],subtitle=subtitle,
                               attributes={'arg':itmsLink},
                               icon=imageurl))

alfred.write(alfred.xml(results,maxresults=None))
