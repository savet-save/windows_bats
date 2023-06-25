@echo off

set files=%*
for %%i in (%files%) do (
	certutil -hashfile "%%i" MD5
)
