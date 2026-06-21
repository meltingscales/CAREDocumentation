# CAREDocumentation

This repository contains documentation for CARE staff to use if they need to modify or update CARE Rust services.

## Installing dependencies

To install dependencies, run the following command:

```bash
just install-deps-cachyos
```


## Building Docs

Docs are built with pandoc, by stitching together multiple *.md files.

```bash
just compile-docs
```
