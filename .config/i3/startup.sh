#!/bin/bash

# Aller au workspace 5 (chat)
i3-msg 'workspace "5: Chat"'
i3-msg 'layout tabbed'

# Lancer Teams
(teams-for-linux &)

# Lancer Signal
(signal-desktop &)

# Lancer Discord
(discord &)

# Lancer WhatsApp
(whatsapp-for-linux &)
