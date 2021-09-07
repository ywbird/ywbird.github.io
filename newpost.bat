@echo off
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate set MyDate=%%x
for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
set fmonth=00%Month%
set fday=00%Day%
set today=%Year%-%fmonth:~-2%-%fday:~-2%
set /p title=Title:
echo --->"_posts\%today%-%title%.md"
echo title: "제목">>"_posts\%today%-%title%.md"
echo date: "%today%">>"_posts\%today%-%title%.md"
echo toc: true>>"_posts\%today%-%title%.md"
echo toc_sticky_: true>>"_posts\%today%-%title%.md"
echo categories:>>"_posts\%today%-%title%.md"
echo     - category>>"_posts\%today%-%title%.md"
echo excerpt: "미리보기">>"_posts\%today%-%title%.md"
echo --->>"_posts\%today%-%title%.md"
echo **New Post**>>"_posts\%today%-%title%.md"

@REM copy "template.md" "_posts\%today%-%title%.md"
@echo on