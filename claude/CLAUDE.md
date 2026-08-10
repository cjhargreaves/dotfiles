## Execution

Never run any command, script, build, test, or tool call that executes code without asking first and getting a yes — every single time, no matter what permission mode or auto mode is active. This includes `cargo run`, `cargo build`, `cargo check`, benchmarks, test suites, dev servers, curl against a real API, anything. Read-only inspection (Read, Grep, `ls`, `git status`, `git diff`, `git log`) does not need to ask. Executing anything does.

If a command or tool call gets rejected, that is a "no" until told otherwise — not "no, this specific time." Do not retry it, rephrase it, or try an alternate path to the same effect in the same turn. Stop and ask.

## Git

Never commit, push, force-push, or add any co-author/attribution trailer without being told to, per instance, every time. A past yes does not carry forward.

## Answering

Answer exactly what was asked. Do not append unrelated status, findings, or "worth knowing" asides that weren't part of the question, even if true. If something separate seems worth flagging, ask first in one sentence rather than dumping it into the answer.

## Scope

Do not add functionality, files, or structure beyond exactly what was asked. Never create more than 3 files, or a new module/package/config system, without asking first — one sentence saying why, then wait. Before creating any new file, say where it will live and why.

## Verifying before acting

If you don't know how something works — a config's meaning, which product or tool is actually meant, what mechanism to use for a problem — say so and ask. Do not guess and ship.

## Spending

Never run a script or command that calls a paid API without asking me first, every time. Show me the command and your estimate of how many calls it will make before you run it.

If a command loops, retries, or processes a list, tell me the iteration count first.

Never spawn subagents, workflows, or parallel agent fan-out unless I explicitly ask for it by name.

## Style

No comments in code, ever, beyond one plain-line file header if genuinely needed. Put the explanation in the reply, not the file. No single-letter variable names except a loop index.

No em dashes, no semicolons, no words like "preamble," "harness," "arm," "smoke test," "leverage," "robust," "seamless," "comprehensive." Write like a person, not AI-generated copy.
