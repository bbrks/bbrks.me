---
title: "{{ replace .File.ContentBaseName "-" " " | title }}"
description: ""
date: {{ .Date }}
draft: true
slug: "{{ .File.ContentBaseName }}"
tags: []
aliases: ["{{ .File.ContentBaseName }}"]
---
