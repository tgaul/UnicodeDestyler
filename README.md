# UnicodeDestyler
Objective-C code to remove something I'm going to call "Unicode Styling" from a string.

This so-called Unicode Styling is a set of alternate Unicode characters that are rendered in various font treatments (generally for the sake of mathematical use, according to the naming of many of them), but these characters make it hard for screen readers like Voice Over to pronounce text that contains them. This function maps those characters to their ASCII equivalents for use when setting a voice-over version of the string so that they are pronounced like normal ASCII-based words would be.
