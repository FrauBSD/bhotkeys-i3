[//]: # ($FrauBSD: bhotkeys-i3/README.md 2026-10-03 21:52:02 -0700 Devin Teske $)

# bhotkeys-i3

The packaged i3 config's audio bindings as rows in the bhotkeys
chord list.

The i3 config FreeBSD ships binds the volume and microphone keys to
`pactl`. This package ships one
[bhotkeys](https://github.com/FrauBSD/bhotkeys) plugin per binding,
each with `listen 0` and no command. bhotkeys does not listen for
them; i3 still owns the key. The rows exist so the chord list under
i3 shows those bindings beside everything else, and so a user can
turn one off, for instance when
[framework-keyboard](https://github.com/FrauBSD/framework-keyboard)
is handling the same key with an on-screen gauge.
`bhotkeys-i3-apply` regenerates `~/.config/i3/bhotkeys.i3` from the
packaged config with the disabled bindsyms left out, and reloads i3.

The plugins are hidden (`session 0`) and off under every other
window manager.

Home: [FrauBSD/bhotkeys-i3](https://github.com/FrauBSD/bhotkeys-i3)

## Requirements

- `bhotkeys`
- i3 with `i3-msg` at run time, and a `~/.config/i3/config` that
  includes the packaged config

## Build / install

```sh
make install    # PREFIX=/usr/local by default
```

Installs 4 plugin files into `${PREFIX}/share/bhotkeys/plugins.d`.

## Rows

| id | chord | i3 binding |
|---|---|---|
| i3-vol-up | XF86AudioRaiseVolume | `pactl set-sink-volume @DEFAULT_SINK@ +10%` |
| i3-vol-down | XF86AudioLowerVolume | `pactl set-sink-volume @DEFAULT_SINK@ -10%` |
| i3-mute | XF86AudioMute | `pactl set-sink-mute @DEFAULT_SINK@ toggle` |
| i3-mic-mute | XF86AudioMicMute | `pactl set-source-mute @DEFAULT_SOURCE@ toggle` |

Each file carries a `# i3 <key> <command>` comment that the apply
script reads; bhotkeys itself ignores it.
