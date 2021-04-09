#!/usr/bin/env python3

import iterm2

async def main(connection):
    @iterm2.TitleProviderRPC
    async def custom_title(
        pwd=iterm2.Reference("path?")):
        return pwd.rsplit('/', 1)[1]
    await custom_title.async_register(connection, "Current Folder", "onl.moritz.current-folder")

iterm2.run_forever(main)