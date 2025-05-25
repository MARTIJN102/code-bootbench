# 🧰 Code Bootbench

[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Stars](https://img.shields.io/github/stars/MARTIJN102/code-bootbench?style=social)](https://github.com/MARTIJN102/code-bootbench/stargazers)
[![Issues](https://img.shields.io/github/issues/MARTIJN102/code-bootbench)](https://github.com/MARTIJN102/code-bootbench/issues)
[![Last Commit](https://img.shields.io/github/last-commit/MARTIJN102/code-bootbench)](https://github.com/MARTIJN102/code-bootbench/commits/main)

Made this because I was sick of having zero structure while trying to learn JavaScript, TypeScript, and React.  
It’s just a CLI installer that dumps everything you need to get your fundamentals straight — without bs.

---

## 📦 What You Get

- 🟩 **JavaScript Essentials**  
  Variables, functions, arrays, objects, closures, async stuff. All split into folders.

- 🟦 **TypeScript Essentials**  
  Types, interfaces, utility types, generics. No handholding, just space to write and learn.

- ⚛️ **React Starter**  
  Vite + React + TS + Router. One page per concept (like `useEffect`, `props`, etc.).

---

## 🚀 Install

No need to clone anything. Just run one of these in your terminal:

**Using curl**:
```bash
bash <(curl -s https://raw.githubusercontent.com/MARTIJN102/code-bootbench/main/install-essentials.sh)
bash <(wget -qO- https://raw.githubusercontent.com/MARTIJN102/code-bootbench/main/install-essentials.sh)
```

Pick what you want:
- JavaScript
- TypeScript
- React

It sets everything up in your current directory.

---

## 🗂️ Folder Structure

Each topic has:

```
index.js      # or .ts/.tsx – your code goes here
index.md      # markdown notes, write stuff down
tutorial.md   # overview of the section (one per area)
```

If you pick React:

```bash
cd react-essentials-vite
npm run dev
```

It opens a browser with all the topics pre-routed.

---

## Why?

Because I was tired of having 50 tabs open and zero working code.

If this helps you get unstuck, cool.  
If not — fork it, change it, do whatever.

---

## 🏷️ Tag your version

If you publish something cool based on this, tag it `#codebootbench`.

Done.
