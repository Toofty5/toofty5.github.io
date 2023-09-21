---
layout: post
title: Scripting
categories: blog
---

I decided today that I didn't really like the filenames on these markdown files for the blog.  They look like this:

```
2022-11-22-hello.markdown
2022-11-25-pardon.markdown
2023-05-16-inspiration.markdown
2023-07-09-Devlog.markdown
2023-07-10-Devlog.markdown
2023-07-13-Devlog.markdown
2023-07-14-Devlog.markdown
2023-07-16-Devlog.markdown
2023-07-20-devlog.markdown
2023-07-21-devlog.markdown
2023-07-24-devlog.markdown
2023-08-08-eink.markdown
```

I wanted it to look like this:
```
000_22-11-22-hello.markdown
001_22-11-25-pardon.markdown
002_23-05-16-inspiration.markdown
003_23-07-09-Devlog.markdown
004_23-07-10-Devlog.markdown
005_23-07-13-Devlog.markdown
006_23-07-14-Devlog.markdown
007_23-07-16-Devlog.markdown
008_23-07-20-devlog.markdown
009_23-07-21-devlog.markdown
010_23-07-24-devlog.markdown
011_23-08-08-eink.markdown
```

I'm not sure if padding to 3 digit index numbers was being a bit ambitious for this blog, but I just wanted something to make the tab-completion a little easier when working with these files.

So I wrote this little thing:

```
i=0
for filename in $(ls *-*-*-*.markdown | sort -n); do
	newfile="$(printf "%03d" $i)_${filename:2}"
	echo $newfile
	mv $filename $newfile
	
	((i++))
done
```

And it did just that!  Except afterwards I realized Jekyll only likes it when you format your files with the date first.

So, that script will just have to live on this little branch forever unused.
