# pokegold-de: Projektnotizen

Ziel: bit-genaue Disassembly von **Pokémon - Goldene Edition (Germany)** (`AAUD`) und **Silberne Edition (Germany)** (`AAXD`).
SHA1 siehe `roms.sha1`. Basis: pret/pokegold (Git-Remote `pret`).

## Bauen

```sh
make -j$(nproc) RGBDS=../rgbds-1.0.4/          # baut pokegold-de.gbc und pokesilver-de.gbc
make RGBDS=../rgbds-1.0.4/ compare
```

- `baserom-gold.gbc` / `baserom-silver.gbc` sind Symlinks auf die Original-ROMs eine Ebene höher (gitignored, nie committen).
- Wenn sich nur LZ-Flags in `gfx/lz.mk` ändern: `make tidy` bzw. `make clean`, sonst werden `.lz` nicht neu gebaut.

## Werkzeuge (../pokecrystal-de-tools, eigenes Repo)

Für Gold: `export DE_ROM=pokegold-de DE_BASEROM=baserom-gold.gbc`
Für Silber: `export DE_ROM=pokesilver-de DE_BASEROM=baserom-silver.gbc`

```sh
../pokecrystal-de-tools/cycle.sh             # build, locate, retext, restring, build, locate
python3 ../pokecrystal-de-tools/todo.py [FILE]
python3 ../pokecrystal-de-tools/cmp.py FILE  # Diff der Disassemblierung Build vs. DE
python3 ../pokecrystal-de-tools/romdiff.py
```

## Erfahrungen aus pokecrystal-de (../pokecrystal-de, siehe dessen CLAUDE.md)

- Text-Engine EU: `<SHY>` ($1e) und `<-LF>` ($1d, PlaceHyphenSplit), Diakritika-Code entfernt, dict-Konstanten mit `jr .place`.
- Ja/Nein-Box 1 breiter, viele `hlcoord`-Verschiebungen, Pokédex-Größe 1 Byte (metrisch), Magikarp in mm, AP statt PP,
  Mystery-Gift-Regioncode $9f, Brief-Nationalität "EG", Map-Sign-Leerzeichen, Town-Map-Silbentrennung.
- Deutsche LZ-Grafiken oft `--literal-only --align 1`; Füllbytes nach LZ beachten.
- Labels können durch Verschiebungen "selbstbestätigend" falsche Texte bekommen → bei Duplikaten prüfen.

## Stand

- 2026-10-02: Setup. Gold baut, 69,4 % positionsgenau, 72,6 % strukturell.

- 2026-10-02 (abends): **Gold und Silber bit-genau** (`make compare` OK für beide, auch nach `make clean`).
  Gold-spezifische Erkenntnisse: Landmarken-Code in eigener Section in Bank $27; "AP"-Kacheln per eigener
  Schleife (`ListMovePP.load_ap`); Predef `DummyPredef2F + 1`; Paragraph-Cursor bei INNERH - 1;
  unbenutzter String `"-<LF>@"` nach `String_Space`; Gold/Silber haben eigene Titel-Tilemaps.
  Bei Silber schreiben retext/restring auch in `dex_entries/gold` → danach zurücksetzen und Silber-Dex
  aus `PokedexDataPointerTable` erzeugen (Bank $68 + Index/64).
  SGB-Rahmen: Quelle ist `*_border.bin` (inkl. Nullen im Mittelteil), nicht die erzeugte `.sgb.tilemap`.
  `regfx.py`/`lzflags.py` finden bei `IF DEF(_GOLD)/ELIF` immer die Gold-Datei → Silber-Grafiken von Hand.
