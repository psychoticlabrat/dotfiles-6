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

ALBUM_ICON = True
MAX_RESULT = 15
COUNTRY = u'GB'

searchTerm = sys.argv[1:]

params = urllib.urlencode({
    'term' : searchTerm,
    'country' : COUNTRY,
    'media': u'apple_music',
    'entity': u'song',
    # 'app': u'music',
    # 'uo': u'4',
    'limit' : MAX_RESULT,})

data = urllib.urlopen(url, params).read()
resultData = json.loads(data)['results']

results = []

results.append(alfred.Item(title=u"Search Apple Music for songs matching \"%s\"" % "".join(searchTerm),
                           subtitle=u"Search Apple Music",
                           attributes= {'uid':alfred.uid(0),
                                        'arg':u"itms://itunes.apple.com/WebObjects/MZStore.woa/wa/search?app=music&term=%s"% searchTerm[0] },
                           icon=u"icon.png"
                           ))

for (idx,e) in enumerate(itertools.islice(resultData, MAX_RESULT)):
    if ALBUM_ICON:
        imageurl = e['artworkUrl60']
        filepath = os.path.join(alfred.work(True), str(e['trackId'])+".png")
        if not os.path.exists(filepath):
            urllib.urlretrieve(e['artworkUrl60'], filepath)
        imageurl = filepath
    else:
        imageurl = u"icon.png"

    try:
        formatKind = e['kind'].title().replace('-', ' ')
    except KeyError:
        formatKind = u"no kind"

    itmsLink = e['trackViewUrl'].replace('https://','itms://') + u'&app=music'

    # subtitle = "%s • %s" % (e['artistName'], formatKind)
    subtitle = "%s • %s" % (e['artistName'], formatKind)
    results.append(alfred.Item(title=e['trackName'],subtitle=subtitle,
                               attributes={'arg':itmsLink},
                               icon=imageurl))

alfred.write(alfred.xml(results,maxresults=None))
