/*
 * Headings: http://www.network-science.de/ascii/ascii.php?x=22&y=4&FONT=small&RICH=no&FORM=left&STRE=no&WIDT=80&TEXT=<YOUR_TEXT_HERE>
 * Font: small
 */

/*
const plugins = [{
  url: 'https://gist.githubusercontent.com/simonwjackson/56fff7941db54c4afb7ff286b74ec401/raw/reddit.sk.js',
  name: 'reddit',
  options: {}
  // blacklist: ['http://www.excite.com']
}]
*/

//Plugins().load(plugins)
const hintsCss = `border: solid 1px hsla(229, 25%, 35%, 1);color: hsla(224, 100%, 90%, 1);background: initial;background-color: hsla(229, 20%, 20%, 1);padding: 4px 8px;font-family: Segoe UI, Helvetica Neue, Helvetica, Arial, sans-serif !important;`

Hints.style(hintsCss)
Hints.style(hintsCss, 'text')

Hints.characters = `asdfgjk`

settings.omnibarSuggestion = false
settings.omnibarMaxResults = 5
settings.stealFocusOnLoad = true
settings.modeAfterYank = 'Normal'
settings.omnibarPosition = 'middle'
settings.tabsThreshold = 0
settings.focusFirstCandidate = true
settings.cursorAtEndOfInput = true
settings.blacklist = {
  'https://github.com': 1,
  'https://calendar.google.com': 1,
  'https://sheets.google.com': 1
}

/*
 __  __                _
|  \/  |__ _ _ __ _ __(_)_ _  __ _ ___
| |\/| / _` | '_ \ '_ \ | ' \/ _` (_-<
|_|  |_\__,_| .__/ .__/_|_||_\__, /__/
            |_|  |_|         |___/
*/

// Unwanted defaults
unmap(';ap')
unmap(';cp')
unmap(';dh')
unmap(';j')
unmap('<Ctrl-i>')
unmap('0')
unmap('B')
unmap('E')
unmap('>>')
unmap('<<')
unmap('cp')
unmap('D')
unmap('F')
unmap('ga')
unmap('gb')
unmap('gc')
unmap('gh')
unmap('gk')
unmap('gn')
unmap('ow')
unmap('S')
unmap('sb')
unmap('sd')
unmap('se')
unmap('sfr')
unmap('sfr')
unmap('sh')
unmap('si')
unmap('on')
unmap('spa')
unmap('spb')
unmap('spc')
unmap('spd')
unmap('spi')
unmap('spk')
unmap('sps')
unmap('sql')
unmap('sw')
unmap('w')
unmap('yj')
unmap('yl')
unmap('zi')
unmap('zo')
unmap('zr')
unmap('<Ctrl-j>')
unmap('R')
unmap('h')
unmap('l')

map('i', 'I')
map('I', 'gi')
map('<Ctrl-d>', 'd')
map('<Ctrl-u>', 'e')

mapkey('h', 'backward', () => { history.go (-1) })
mapkey('l', 'forward', () => { history.go (1) })

/*
mapkey('gB', 'Open Bookmarks', tab('vivaldi://bookmarks'))
mapkey('gbc', 'Open Chronometer', tab('https://cronometer.com'))
mapkey(
  'gbs',
  'Open Spotify Discovery',
  tab('https://open.spotify.com/user/spotify/playlist/37i9dQZEVXcCGZby8wPbtE')
)
mapkey(
  'gbi',
  'Open codetree.com',
  tab(
    'https://codetree.com/projects/4jM9/issues?assignee=simonwjackson&blocked=false&milestone=Abrasive+Ascent'
  )
)
*/

/*
 ___                  _
/ __| ___ __ _ _ _ __| |_
\__ \/ -_) _` | '_/ _| ' \
|___/\___\__,_|_| \__|_||_|
*/

/*
function searchAlias(key, name, url, msg) {
  msg = msg || `Search Selected with ${name}`
  addSearchAlias(key, name, url)
  mapkey(`o${key}`, msg, `searchSelectedWith("${url}")`)
  vmapkey(`o${key}`, msg, `searchSelectedWith("${url}")`)
}
searchAlias('r', 'reddit', 'https://www.reddit.com/search?q=')
searchAlias('g', 'google', 'https://www.google.com/search?q=')
searchAlias(
  'a',
  'amazon',
  'https://www.amazon.com/s/ref=nb_sb_noss_2?field-keywords='
)
searchAlias('s', 'stackoverflow', 'http://stackoverflow.com/search?q=')
searchAlias('d', 'dictionary', 'http://www.dictionary.com/browse/')
searchAlias('w', 'wikipedia', 'https://en.wikipedia.org/wiki/')
*/

/*
  ___ ___ ___
 / __/ __/ __|
| (__\__ \__ \
 \___|___/___/
*/

settings.theme = `
html > body {
  font-weight: 400;
  font-family: Segoe UI, Helvetica Neue, Helvetica, Arial, sans-serif !important;
}
html > body input {
  font-weight: 100;
}
.sk_ui html {
  background: rgba(0, 0, 0, 0.66);
}
.sk_theme {
  --main-bg-color: hsla(229, 20%, 20%, 1);
  --main-bg-alt-color: hsla(229, 20%, 25%, 1);
  --main-fg-color: hsla(224, 100%, 90%, 1);
  --main-fg-darker-color: hsla(224, 100%, 90%, .5);
  --main-fg-highlight-color: #a98aff;
  background-color: var(--main-bg-color) !important;
  color: var(--main-fg-color) !important;
}
/*#sk_omnibarSearchResult > ul > li:nth-child(odd) {
  background-color: unset;
}*/
#sk_omnibarSearchArea {
  padding: 1em;
}
.sk_theme .prompt,
.sk_theme .url,
.sk_theme .omnibar_visitcount,
.sk_theme .resultPage {
  color: var(--main-fg-darker-color);
}
.sk_theme input,
.sk_theme .annotation {
    color: var(--main-fg-color);
}
#sk_omnibarSearchResult li div.url {
    padding-left: 0.9rem;
    display: none;
}
#sk_omnibarSearchResult li div.title::first-letter {
  display: none;
}
#sk_omnibarSearchResult li div.title {
    white-space: nowrap;
    overflow: hidden !important;
    text-overflow: ellipsis;
    margin-bottom: 0rem;
}
#sk_omnibarSearchResult > ul > li:nth-child(odd) {
  background-color: var(--main-bg-alt-color);
}
/*#sk_omnibarSearchArea .prompt,
#sk_omnnibarSearchArea .resultPage {
  font-size: .66rem;
  padding-top: .5rem;
  opacity: .5;
}*/
#sk_omnibarSearchResult > ul {
  margin-bottom: 0;
}
#sk_omnibarSearchResult > ul > li {
    margin: 0rem;
    padding: .66rem;
    display: block;
}
/*.sk_theme ul > li {
    font-weight: bold
}*/
.sk_theme .omnibar_folder,
.sk_theme .omnibar_timestamp {
    color: var(--main-fg-darker-color);
}
#sk_omnibar {
  max-width: 500px;
  position: static !important;
  margin: 150px auto;
  border-radius: unset;
}
#sk_omnibar span.omnibar_highlight {
    color: var(--main-fg-highlight-color);
}
.sk_theme .focused {
    color: var(--main-fg-highlight-color) !important;
    background-color: hsla(229, 21%, 15%, 1) !important;
}
.sk_theme .seperator {
    padding-left: .2rem;
    padding-right: .2rem;
}
.sk_omnibar_middle #sk_omnibarSearchArea {
    border-bottom: 1px solid var(--main-fg-highlight-color);
    padding: 1rem;
    margin: unset;
}
.title-icon {
    visibility: hidden;
    width: 3px;
    display: inline-block;
}
`

// $(document).ready(() => {
//   const style = $('<style>').attr('type','text/css').html(`
//     @media screen {
//       /* Leading rule */

//       html {
//         -webkit-filter: invert(100%) hue-rotate(180deg) brightness(110%) contrast(90%) grayscale(20%) sepia(10%) !important;
//       }

//       /* Contrary rule */
//       img, video, :not(object):not(body)>embed, object,
//       iframe,
//       svg image,
//       [style*='background:url'], [style*='background-image:url'],
//       [style*='background: url'], [style*='background-image: url'],
//       [background],
//       twitterwidget {
//         -webkit-filter: invert(100%) hue-rotate(180deg) !important;
//       }
//       [style*='background:url'] *, [style*='background-image:url'] *,
//       [style*='background: url'] *, [style*='background-image: url'] *,
//       input,
//       [background] * {
//         -webkit-filter: none !important;
//       }
//       iframe:not([title='Disqus']) {
//         background: white !important;
//       }

//       /* Text contrast */
//       html {
//         text-shadow: 0 0 0 !important;
//       }

//       /* Full screen */
//       *:-webkit-full-screen, *:-webkit-full-screen * {
//         -webkit-filter: none !important;
//       }

//       /* Page background */
//       html {
//         background: rgb(13,13,13) !important;
//       }

//       /* Custom rules */
//       #disqus_thread > :first-child { background: black !important; }

//       }
//   `)

//   $('head').append(style)
// })

/*
 ___                 _
|   \ ___ _ __  __ _(_)_ _  ___
| |) / _ \ '  \/ _` | | ' \(_-<
|___/\___/_|_|_\__,_|_|_||_/__/
*/

/*run('https://github.com', () => {
  function hideChineseIssues() {
    const anyChineseChar = /[\u4E00-\u9FCC\u3400-\u4DB5\uFA0E\uFA0F\uFA11\uFA13\uFA14\uFA1F\uFA21\uFA23\uFA24\uFA27-\uFA29]|[\ud840-\ud868][\udc00-\udfff]|\ud869[\udc00-\uded6\udf00-\udfff]|[\ud86a-\ud86c][\udc00-\udfff]|\ud86d[\udc00-\udf34\udf40-\udfff]|\ud86e[\udc00-\udc1d]/
    document.querySelectorAll('.Box-row').forEach(row => {
      const matches = row.innerHTML.match(anyChineseChar)
      if (matches) row.style.display = "none"
    })
  }
  hideChineseIssues()
})
run('https://codetree.com', () => {
  function score2time(elm, index) {
    elm.innerHTML = parseInt(elm.innerHTML) / 60 + 'h'
  }
  document.querySelectorAll('.total-size').forEach(score2time)
})*/

/*
 _   _ _   _ _
| | | | |_(_) |___
| |_| |  _| | (_-<
 \___/ \__|_|_/__/
*/

function run(urlPattern, fn) {
  if (document.origin === urlPattern) fn()
}

function tab(url) {
  return () => window.open(url, '_blank')
}

function ready(fn) {
  return document.addEventListener('DOMContentLoaded', fn)
}

/*
 ___ _           _
| _ \ |_  _ __ _(_)_ _  ___
|  _/ | || / _` | | ' \(_-<
|_| |_|\_,_\__, |_|_||_/__/
           |___/
*/

/*function Storage(name) {
  return {
    read() {
      const storage = localStorage.getItem(name) || '{}'
      return JSON.parse(storage)
    },
    write(storage) {
      return localStorage.setItem(name, JSON.stringify(storage))
    }
  }
}*/

/*function Plugins(expires = 3600) {
  const storage = Storage('plugins')
  function toText(res) {
    return res.text()
  }
  return {
    async load(plugins) {
      const data = storage.read()
      function download({
        name,
        url
      }) {
        return fetch(url, {
            mode: 'cors'
          })
          .then(toText)
          .then(code => {
            const date = new Date().getTime()
            data[name] = {
              code,
              date
            }
            return code
          })
      }
      async function loadPlugin({
        name,
        url
      }) {
        if (!data[name] || new Date().getTime() > data[name].date + expires) {
          await download({
            name,
            url
          })
          storage.write(data)
        }
        eval(data[name].code)
      }
      plugins
        // .filter(p => !p.blacklist.includes(document.origin))
        .map(loadPlugin)
    }
  }
}*/

// const magnet =
//   'magnet:' +
//   '?xt=urn:btih:' +
//   hash +
//   '&dn=' +
//   encodeURIComponent(name) +
//   '&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80' +
//   '&tr=udp%3A%2F%2Fopentor.org%3A2710' +
//   '&tr=udp%3A%2F%2Ftracker.ccc.de%3A80' +
//   '&tr=udp%3A%2F%2Ftracker.blackunicorn.xyz%3A6969' +
//   '&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969' +
//   '&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969'

// white-space: nowrap;
// overflow: hidden;
// text-overflow: ellipsis;


// ;(function(options) {
// command('torrents', 'torrents list', ([search]) => {
//   const url = `https://kfbsjof3r3.execute-api.us-east-1.amazonaws.com/dev/hello-world?search=${search}`

//   function reddit2list(json) {
//     return json.map(child => ({
//       title: child.title.trim(),
//       url: child.link
//     }))
//   }

//   fetch(url, { mode: 'cors' })
//     .then(response => response.json())
//     .then(reddit2list)
//     .then(items => {
//       Front.omnibar.show()
//       // Omnibar.listWords(words)
//       Omnibar.listResults(items, item => {
//         return $('<li/>')
//           .html(`<span class='title-icon'>📰</span> ${item.title}`)
//           .data('query', item.title)
//           .data('url', item.link)
//           .
//       })
//     })
// })
// })(options)