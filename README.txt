This is a forked version of the awesome digestif by astoff, adding
support for aplTeX which uses a different texmf directory structure,
and does not provide kpsewhich support.

To install, follow the below procedure:

,--------
| zip -j digestif.zip digestif/*.lua data/*.tags
| doas mv digestif.zip /usr/local/lib/texmf/luatex/digestif.zip
| doas ln -s /usr/local/bin/luatex /usr/local/bin/texlua
| doas install bin/digestif.texlua /usr/local/bin/digestif
`--------

Optionally, you can remove the tags files under data directory which
is for macro packages not available in aplTeX. Only `plain.tags',
`primitives.tags', `teximpatient.tags' and `texinfo.tags' are needed.

You can use the provided `scripts/extract-apltex.lua' to generate tags
files for macro packages in your texmf. After generating, make sure
they are bundled in the zip archive and placed properly.
