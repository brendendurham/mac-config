// SurfingKeys Configuration for Dvorak

// Set theme
settings.theme = '\
.sk_theme { \
    background: #fff; \
    color: #000; \
} \
.sk_theme tbody { \
    color: #000; \
} \
.sk_theme input { \
    color: #000; \
} \
.sk_theme .url { \
    color: #555; \
} \
.sk_theme .annotation { \
    color: #555; \
} \
';

// Search aliases
addSearchAlias('g', 'google', 'https://www.google.com/search?q=');
addSearchAlias('gh', 'github', 'https://github.com/search?q=');
addSearchAlias('yt', 'youtube', 'https://www.youtube.com/results?search_query=');

// Custom key mappings for Dvorak
// Navigation (using Dvorak home row)
map('h', 'j');  // Down (h in Dvorak is where j is in QWERTY)
map('t', 'k');  // Up (t in Dvorak is where k is in QWERTY)
map('d', 'h');  // Left (d in Dvorak is where h is in QWERTY)
map('n', 'l');  // Right (n in Dvorak is where l is in QWERTY)

// Half-page scrolling
map('H', 'd');  // Scroll down half page
map('T', 'u');  // Scroll up half page

// History navigation
map('D', 'S');  // Go back in history
map('N', 'D');  // Go forward in history

// Tab operations (adapted for Dvorak)
map('gt', 'R'); // Go to next tab
map('gT', 'E'); // Go to previous tab

// Disable keys on certain sites
unmapAllExcept(['H', 'T', 'D', 'N'], /mail.google.com/);

// Custom settings
settings.smoothScroll = true;
settings.scrollStepSize = 140;
settings.hintAlign = "left";
settings.useNeovim = true;

// Open links in new tab
settings.newTabPosition = "last";
settings.focusOnSaved = false;

// Hints - Using Dvorak home row keys
Hints.characters = 'htnsaoeiu';  // Dvorak home row keys
settings.hintAlign = "left";

// Visual mode mappings
vmap('h', 'j');  // Down in visual mode
vmap('t', 'k');  // Up in visual mode
vmap('d', 'h');  // Left in visual mode
vmap('n', 'l');  // Right in visual mode