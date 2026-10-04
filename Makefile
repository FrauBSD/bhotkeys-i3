############################################################ LICENSE
#
# SPDX-License-Identifier: BSD-2-Clause
#
# Copyright (c) 2026 Devin Teske <dteske@FreeBSD.org>
#
############################################################ IDENT(1)
#
# $Title: bhotkeys-i3 - i3 panel shortcuts $
# $Copyright: 2026 Devin Teske. All rights reserved. $
# $FrauBSD: bhotkeys-i3/Makefile 2026-10-03 21:48:50 -0700 Devin Teske $
#
############################################################ PATHS

PREFIX?=	/usr/local
PLUGDIR?=	${PREFIX}/share/bhotkeys/plugins.d

############################################################ FILES

# listen 0. i3 owns the key. Shown only when the session is i3.
# RUN_DEPENDS bhotkeys.
PLUGINS=	i3-mic-mute \
		i3-mute \
		i3-vol-down \
		i3-vol-up

############################################################ TARGETS

.PHONY: install

install:
	mkdir -p ${DESTDIR}${PLUGDIR}
.for p in ${PLUGINS}
	install -m 644 plugins.d/${p} \
		${DESTDIR}${PLUGDIR}/${p}
.endfor

################################################################################
# END
################################################################################
