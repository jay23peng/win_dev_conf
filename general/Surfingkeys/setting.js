// ************************* Surfingkeys Config ***********************************
//
// The file contains the default mappings, and it is released un-minified
// for your referrence on creating your own mappings.
//
// But please don't just copy statement from this file to your own settings.
// As the bound functions in this file may rely on some unstable functions/
// variables, which may be changed some day. If you insist on that, please
// compare your settings with this file to find what stops your keystrokes
// from working.
//
// Therefore, the best practice to remap is using map instead of mapkey, for
// example:
//
//      map('F', 'af');
//
// is better than
//
//      mapkey('F', '#1Open a link in new tab', 'Hints.create("", Hints.dispatchMouseClick, {tabbed: true})');
//
// most of the implementation is from:
//   https://github.com/brookhong/Surfingkeys/blob/57fccbbeeb60ee2be0d2d60cfc50bd3aca3b0436/pages/default.js
//   https://github.com/brookhong/Surfingkeys/blob/57fccbbeeb60ee2be0d2d60cfc50bd3aca3b0436/background.js
//
// ************************* Surfingkeys Config ***********************************


// --------------------------------------------------------------------------------
// Backward Forward
// --------------------------------------------------------------------------------
unmap('S');
unmap('D');
unmap('<Space>');
mapkey('u', '#4Go back in history', function() {
    history.go(-1);
}, {repeatIgnore: true});

mapkey('<Ctrl-r>', '#4Go forward in history', function() {
    history.go(1);
}, {repeatIgnore: true});

// --------------------------------------------------------------------------------
// Page navigation
// --------------------------------------------------------------------------------
mapkey('k', '#2Scroll a page up', function() {
    Normal.scroll('pageUp');
}, {repeatIgnore: true});

mapkey('j', '#2Scroll a page down', function() {
    Normal.scroll('pageDown');
}, {repeatIgnore: true});

mapkey('K', '#2Scroll a page up', function() {
    Normal.scroll('pageUp');
}, {repeatIgnore: true});

mapkey('J', '#2Scroll a page down', function() {
    Normal.scroll('pageDown');
}, {repeatIgnore: true});

// --------------------------------------------------------------------------------
// Tab Control
// --------------------------------------------------------------------------------
unmap('d');
map('D', 'x');

mapkey('o', '#8Open a URL in current tab', function() {
    Front.openOmnibar({type: "URLs", extra: "getAllSites", tabbed: false});
});


mapkey('.', 'Choose a tab', function() {
    Front.chooseTab();
});

mapkey('<Space>bu', '#4Go to last used tab', function() {
    RUNTIME("goToLastTab");
});

mapkey('<Space>bb', 'Choose a tab with omnibar', function() {
    Front.openOmnibar({type: "Tabs"});
});


mapkey('<Space>bp', '#4Go to last previous tab', function() {
    RUNTIME("previousTab");
});

mapkey('<Space>bn', '#4Go to last next tab', function() {
    RUNTIME("nextTab");
});

// --------------------------------------------------------------------------------
// Copy/Paste
// --------------------------------------------------------------------------------
mapkey('yy', '#8Yank Selected Text', function() {
    var text = "";
    if (window.getSelection) {
        text = window.getSelection().toString();
    } else if (document.selection && document.selection.type != "Control") {
        text = document.selection.createRange().text;
    }
    Clipboard.write(text);
}, {repeatIgnore: true});

mapkey('Y', "#7Copy current page's URL", function() {
    Clipboard.write(window.location.href);
});

mapkey('p', "Open the clipboard's URL in the current tab", function() {
    Clipboard.read(function(response) {
        return () => window.open(response.data, '_blank')
    });
});

// --------------------------------------------------------------------------------
// General
// --------------------------------------------------------------------------------
Hints.characters = 'barstdqwfpgzxcv';
settings.smoothScroll=false;
settings.tabsThreshold = 18;
settings.omnibarPosition = 'bottom'
settings.blacklist = {
  'https://calendar.google.com': 1,
  'https://sheets.google.com': 1
}

// --------------------------------------------------------------------------------
// Monokai Theme
// https://github.com/Foldex/surfingkeys-config
// https://gist.github.com/emraher/2c071182ce0f04f3c69f6680de335029
// --------------------------------------------------------------------------------

// ---- Hints ----
// Hints have to be defined separately
// Uncomment to enable
Hints.style('border: solid 2px #2D2E2E; color:#F92660; background: initial; background-color: #272822;');
Hints.style("border: solid 2px #2D2E2E !important; padding: 1px !important; color: #A6E22E !important; background: #272822 !important;", "text");
Visual.style('marks', 'background-color: #A6E22E99;');
Visual.style('cursor', 'background-color: #F92660;');

settings.theme = `
/* Edit these variables for easy theme making */
:root {
  /* Font */
  --font: 'FiraMono Nerd Font', Ubuntu, Monaco, sans;
  --font-size: 12;
  --font-weight: bold;

  --fg: #F8F8F2;
  --bg: #272822;
  --bg-dark: #1D1E19;
  --border: #2D2E2E;
  --main-fg: #F92660;
  --accent-fg: #E6DB74;
  --info-fg: #A6E22E;
  --select: #556172;

  /* Unused Alternate Colors */
  /* --red: #E74C3C; */
  /* --orange: #FD971F; */
  /* --blue: #268BD2; */
  /* --violet: #9C91E4; */
  /* --cyan: #66D9EF; */
}

/* ---------- Generic ---------- */
.sk_theme {
background: var(--bg);
color: var(--fg);
  background-color: var(--bg);
  border-color: var(--border);
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
}

input {
  font-family: var(--font);
  font-weight: var(--font-weight);
}

.sk_theme tbody {
  color: var(--fg);
}

.sk_theme input {
  color: var(--fg);
}

/* Hints */
#sk_hints .begin {
  color: var(--accent-fg) !important;
}
#sk_tabs .sk_tab {
  background: var(--bg-dark);
  border: 1px solid var(--border);
}
#sk_tabs .sk_tab_hint {
  background: var(--bg);
  border: 1px solid var(--border);
  color: var(--accent-fg);
}
#sk_tabs .sk_tab_title {
  color: var(--fg);
}
#sk_tabs .sk_tab_url {
  color: var(--main-fg);
}
.sk_theme #sk_frame {
  background: var(--bg);
  opacity: 0.2;
  color: var(--accent-fg);
}

/* ---------- Omnibar ---------- */
/* Uncomment this and use settings.omnibarPosition = 'bottom' for Pentadactyl/Tridactyl style bottom bar */
.sk_theme#sk_omnibar {
  width: 100%;
  left: 0;
} 

.sk_theme .title {
  color: var(--accent-fg);
}

.sk_theme .url {
  color: var(--main-fg);
}

.sk_theme .annotation {
  color: var(--accent-fg);
}

.sk_theme .omnibar_highlight {
  color: var(--accent-fg);
}

.sk_theme .omnibar_timestamp {
  color: var(--info-fg);
}

.sk_theme .omnibar_visitcount {
  color: var(--accent-fg);
}

.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: var(--bg-dark);
}

.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: var(--border);
}

.sk_theme #sk_omnibarSearchArea {
  border-top-color: var(--border);
  border-bottom-color: var(--border);
}

.sk_theme #sk_omnibarSearchArea input,
.sk_theme #sk_omnibarSearchArea span {
  font-size: var(--font-size);
}

.sk_theme .separator {
  color: var(--accent-fg);
}

/* ---------- Popup Notification Banner ---------- */
#sk_banner {
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
  background: var(--bg);
  border-color: var(--border);
  color: var(--fg);
  opacity: 0.9;
}

/* ---------- Popup Keys ---------- */
#sk_keystroke {
  background-color: var(--bg);
}

.sk_theme kbd .candidates {
  color: var(--info-fg);
}

.sk_theme span.annotation {
  color: var(--accent-fg);
}

/* ---------- Popup Translation Bubble ---------- */
#sk_bubble {
  background-color: var(--bg) !important;
  color: var(--fg) !important;
  border-color: var(--border) !important;
}

#sk_bubble * {
  color: var(--fg) !important;
}

#sk_bubble div.sk_arrow div:nth-of-type(1) {
  border-top-color: var(--border) !important;
  border-bottom-color: var(--border) !important;
}

#sk_bubble div.sk_arrow div:nth-of-type(2) {
  border-top-color: var(--bg) !important;
  border-bottom-color: var(--bg) !important;
}

/* ---------- Search ---------- */
#sk_status,
#sk_find {
  font-size: var(--font-size);
  border-color: var(--border);
}

.sk_theme kbd {
  background: var(--bg-dark);
  border-color: var(--border);
  box-shadow: none;
  color: var(--fg);
}

.sk_theme .feature_name span {
  color: var(--main-fg);
}

/* ---------- ACE Editor ---------- */
#sk_editor {
  background: var(--bg-dark) !important;
  height: 50% !important;
  /* Remove this to restore the default editor size */
}

.ace_dialog-bottom {
  border-top: 1px solid var(--bg) !important;
}

.ace-chrome .ace_print-margin,
.ace_gutter,
.ace_gutter-cell,
.ace_dialog {
  background: var(--bg) !important;
}

.ace-chrome {
  color: var(--fg) !important;
}

.ace_gutter,
.ace_dialog {
  color: var(--fg) !important;
}

.ace_cursor {
  color: var(--fg) !important;
}

.normal-mode .ace_cursor {
  background-color: var(--fg) !important;
  border: var(--fg) !important;
  opacity: 0.7 !important;
}

.ace_marker-layer .ace_selection {
  background: var(--select) !important;
}

.ace_editor,
.ace_dialog span,
.ace_dialog input {
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
}
`;

