# BACKLOG.md

Open work items from the 2026-10-06 config audit. Durable rules live in AGENTS.md.
Verify any change with the all-host toplevel evals in AGENTS.md → Commands.

1. **Firefox profile settings → `policies.Preferences`**
   Profile-level `settings` in `home/will/desktop/default.nix` do not reach the live
   profile on arrakis (Firefox StoreID migration; no `user.js` in active
   `vol1ho3j.default/`). Pocket/signon/search prefs are currently inert. Move
   must-apply prefs into `policies.Preferences` for will + tv; optionally evaluate
   hm's `storeId` bridge afterward.

2. **Extract `modules/base.nix`, dedupe flake glue**
   The three `hosts/*/configuration.nix` are ~90% identical
   (timezone/locale/pipewire/networkmanager/xkb/CUPS/unfree/flakes-features);
   `flake.nix` repeats the home-manager block per host. This exact drift caused two
   hosts to sit broken while arrakis got fixed. Per-host files should keep only real
   differences (WOL, libinput, extra users). Decide `services.xserver.enable`
   inconsistency (arrakis omits it) during the pass.

3. **Remove dead code**
   - commented `nixos-cosmic` debris: `flake.nix:17-24`, `:31`, `:61-65`;
     `hosts/arrakis/configuration.nix:65-66` (line refs from HEAD 522619c)
   - `home/will/admin/` — README-only, imported nowhere
   - commented `/* home.packages */` stubs in all 4 `hosts/*/users/*/default.nix`;
     empty `imports` in `users/tv/default.nix`

4. **Consolidate tv's inline Firefox profile**
   `hosts/giedi-prime/users/tv/default.nix` inlines the Firefox profile and
   duplicates `desktop/tv` mechanics (`devPixelsPerPx` in both). Fold into a shared
   module once item 1 lands.

5. **Machine cleanup (outside repo)**
   `~/.mozilla/firefox/default/` on arrakis is an orphaned hm profile dir; remove by
   hand once item 1 makes user.js unnecessary.
