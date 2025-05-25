#!/bin/bash

set -e

GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
NC="\033[0m"

INSTALL_DIR="$(pwd)"
echo -e "${YELLOW}Using current directory as root: $INSTALL_DIR${NC}"

NOTE_TEMPLATE="# 📝 Topic: [Replace with topic name]

## ✅ What it does

Explain the concept in your own words.
- What problem does it solve?
- Where is it used?

## 💡 Syntax Example

\`\`\`js
// code snippet here
\`\`\`

## 🧠 Mental Model

Explain how you think about this.
Use analogies or visuals if helpful.

## 🧪 Practice

- Try this small challenge:
  - [ ] Example problem or mini goal
"

JS_RUN_COMMENT="// ▶️ To run this file:\n// 1. Install Node.js: https://nodejs.org\n// 2. Run in terminal: node index.js\n"
TS_RUN_COMMENT="// ▶️ To run this file:\n// 1. Install Node.js: https://nodejs.org\n// 2. Install ts-node: npm install -g ts-node typescript\n// 3. Run in terminal: npx ts-node index.ts\n"

JS_TUTORIAL_MD="# JavaScript Essentials

Master the core language that powers the web.

This section gives you hands-on structure to understand how JavaScript really works — not just how to write it, but how to **think** in it.

You’ll cover:
- 🔢 Variables, coercion, and types that lie to you
- 🧠 Functions, scope, and the weirdness of \`this\`
- 🔁 Arrays and objects — and when to reach for \`map\`, \`reduce\`, or \`forEach\`
- ⚠️ Common traps like hoisting, implicit globals, and type juggling

Each topic has its own folder with:
- \`index.js\` → space to write + test code
- \`index.md\` → a guided note template to build your mental model"

TS_TUTORIAL_MD="# TypeScript Essentials

Take control of your JavaScript with types that mean business.

TypeScript helps you scale apps without drowning in bugs. This section helps you actually understand:
- 🔍 Type annotations, interfaces, type aliases, and when to use what
- 🧩 Utility types like \`Pick\`, \`Partial\`, \`Record\`, and \`Omit\`
- ⚙️ Generics, constraints, and default types
- 🧠 Narrowing, unions, discriminated unions, and conditional types

Each topic has:
- \`index.ts\` → start experimenting with real code
- \`index.md\` → notes to explain *why* things work that way"

REACT_TUTORIAL_MD="# React Essentials

Learn how to build fast, interactive UIs with React — the right way.

You’ll walk through:
- 🧱 JSX and reusable components
- 🧠 Props, state, and controlled inputs
- 🔄 Effects, rendering flow, and event handling
- 🧰 Routing, lifting state, and using hooks effectively

This setup gives you:
- A preconfigured Vite + React + TypeScript project
- One route per concept — rendered by a real React component
- Space in each \`src/pages/PageName.tsx\` to learn-by-doing

No tutorial hell. Just real practice in a working app."

echo -e "${YELLOW}Select components to install (e.g. 1 2):${NC}"
echo "1) JavaScript Essentials"
echo "2) TypeScript Essentials"
echo "3) React Tutorial Environment"
echo "4) Quit"
read -p "Your choices: " -a CHOICES

for choice in "${CHOICES[@]}"; do
  case $choice in
    1)
      echo -e "${YELLOW}Installing full JavaScript Essentials...${NC}"
      mkdir -p javascript
      echo "$JS_TUTORIAL_MD" > javascript/tutorial.md

      declare -A JS_STRUCTURE=(
        [basics]="let-const-var typeof-coercion operators primitive-vs-reference"
        [functions]="function-declarations-vs-expressions arrow-vs-normal default-parameters"
        [scope-and-closure]="function-scope block-scope global-scope closures hoisting"
        [this-and-binding]="arrow-this bind-call-apply context-switching"
        [types-and-coercion]="typeof-instanceof-nan truthy-falsy"
        [arrays]="create-access-update map filter reduce forEach find includes sort slice-splice flat"
        [objects]="create-update-delete dot-vs-bracket-access destructuring spread-rest entries-values-keys"
        [data-structures]="sets-weaksets maps-weakmaps array-of-objects"
        [promises-and-async]="event-loop call-stack-queue promises chaining-then async-await async-error-handling"
        [timers-and-intervals]="setTimeout-setInterval debounce-throttle"
        [dom-manipulation]="querySelector-getElementById innerText-innerHTML-classList"
        [event-handling]="add-remove-event-listener bubbling-delegation form-handling"
        [browser-api-examples]="fetch-api localStorage-sessionStorage navigator-api clipboard-api"
        [design-patterns]="module-pattern factory-functions singleton observer-pubsub"
        [functional-programming]="currying-partial-application pure-functions immutability"
        [modules-and-imports]="esm-modules"
        [memory-and-performance]="memory-leaks performance-profiling"
        [custom-utils]="debounce cloneDeep groupBy"
        [refactoring-practice]="bad-loops-to-map-filter-reduce"
        [regex]="test-match-replace"
        [interview-practice]="common-questions"
        [codewars-katas]="exercise-set-1"
      )

      for category in "${!JS_STRUCTURE[@]}"; do
        for topic in ${JS_STRUCTURE[$category]}; do
          mkdir -p "javascript/$category/$topic"
          echo -e "$JS_RUN_COMMENT" > "javascript/$category/$topic/index.js"
          echo "${NOTE_TEMPLATE//\[Replace with topic name\]/$topic}" > "javascript/$category/$topic/index.md"
        done
      done
      ;;
    2)
      echo -e "${YELLOW}Installing full TypeScript Essentials...${NC}"
      mkdir -p typescript
      echo "$TS_TUTORIAL_MD" > typescript/tutorial.md

      declare -A TS_STRUCTURE=(
        [basics]="typescript-vs-javascript setup-and-tsconfig basic-types functions-and-params type-inference"
        [types-vs-interfaces]="basic-differences readonly-vs-optional merge-vs-extend"
        [generics]="generic-functions generic-interfaces constraints default-types"
        [utility-types]="partial-required-pick omit-record readonly-and-nonnullable"
        [advanced-types]="intersection-union discriminated-unions type-guards conditional-types"
        [enums]="numeric-vs-string const-vs-normal"
        [dom-types]="event-types element-types"
        [declaration-files]="when-to-use dts-file-structure"
        [type-narrowing]="typeof-checks in-checks discriminated-checks"
        [migrating-js-to-ts]="refactor-example common-traps"
        [custom-types]="literal-types type-aliases"
        [tsconfig-and-compiler]="strict-mode compiler-flags"
      )

      for category in "${!TS_STRUCTURE[@]}"; do
        for topic in ${TS_STRUCTURE[$category]}; do
          mkdir -p "typescript/$category/$topic"
          echo -e "$TS_RUN_COMMENT" > "typescript/$category/$topic/index.ts"
          echo "${NOTE_TEMPLATE//\[Replace with topic name\]/$topic}" > "typescript/$category/$topic/index.md"
        done
      done
      ;;
    3)
      echo -e "${YELLOW}Installing React Essentials Tutorial...${NC}"
      PROJECT_NAME="react-essentials-vite"
      mkdir -p "$PROJECT_NAME"
      cd "$PROJECT_NAME"
      echo "$REACT_TUTORIAL_MD" > tutorial.md

      npm create vite@latest . -- --template react-ts --force --yes
      npm install
      npm install react-router-dom

      PAGES=("jsx" "components" "props" "state" "use-effect" "conditional-rendering" "lists-and-keys")
      mkdir -p src/pages

      kebab_to_pascal() {
        IFS='-' read -ra parts <<< "$1"
        for part in "${parts[@]}"; do
          printf "%s" "$(tr '[:lower:]' '[:upper:]' <<< "${part:0:1}")${part:1}"
        done
      }

      for page in "${PAGES[@]}"; do
        component_name="$(kebab_to_pascal "$page")"
        cat <<EOL > "src/pages/${component_name}.tsx"
import React from 'react';

const ${component_name} = () => {
  return (
    <div>
      <h1>${component_name}</h1>
      <p>This is the ${page} example page.</p>
    </div>
  );
};

export default ${component_name};
EOL
      done

      cat <<EOL > src/pages/NotFound.tsx
import React from 'react';

export default function NotFound() {
  return <h1>404 - Page Not Found</h1>;
}
EOL

      cat <<EOL > src/App.tsx
import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import NotFound from './pages/NotFound';
$(for page in "${PAGES[@]}"; do component_name="$(kebab_to_pascal "$page")"; echo "import ${component_name} from './pages/${component_name}';"; done)

function App() {
  return (
    <Router>
      <div>
        <h1>React Essentials Tutorial</h1>
        <nav>
          <ul>
$(for page in "${PAGES[@]}"; do echo "            <li><Link to='/${page}'>${page}</Link></li>"; done)
          </ul>
        </nav>
        <Routes>
$(for page in "${PAGES[@]}"; do component_name="$(kebab_to_pascal "$page")"; echo "          <Route path='/${page}' element={<${component_name} />} />"; done)
          <Route path='*' element={<NotFound />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
EOL

      cat <<EOL > src/main.tsx
import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
EOL
      cd ..
      ;;
    4)
      echo -e "${YELLOW}Exited by user.${NC}"
      exit 0
      ;;
    *)
      echo -e "${RED}Invalid selection: $choice${NC}"
      ;;
  esac
done

echo -e "${GREEN}✅ Setup complete in: $INSTALL_DIR${NC}"