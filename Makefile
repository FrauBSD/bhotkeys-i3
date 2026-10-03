# bhotkeys-i3: i3 shortcuts, advertised in the panel.
# listen 0. i3 owns the key. Shown only when the session is i3.
# RUN_DEPENDS bhotkeys.
#
PREFIX?=	/usr/local
PLUGDIR?=	${PREFIX}/share/bhotkeys/plugins.d

PLUGINS=	i3-mic-mute \
		i3-mute \
		i3-vol-down \
		i3-vol-up

install:
	mkdir -p ${DESTDIR}${PLUGDIR}
.for p in ${PLUGINS}
	install -m 644 plugins.d/${p} \
		${DESTDIR}${PLUGDIR}/${p}
.endfor

.PHONY: install
