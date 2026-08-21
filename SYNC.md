# Lane 2 - Memory Auto-Sync

This repo (octopuss-memory) is auto-committed and pushed to GitHub on a schedule so the MacBook Air (MBA) and Mac Mini (MM) stay in sync.

## How it works
- A background job (macOS launchd) runs every 30 minutes on each Mac.
- It pulls the other Mac changes first (fast-forward only), then commits and pushes anything new.
- Safety rail: if a run would delete more than 8 files, it refuses to commit and logs REVIEW NEEDED. This prevents an empty/hollow checkout from wiping the brain on GitHub.

## Where things live (on each Mac)
- Sync script: Octopuss/shared/_sync/octopuss-sync.sh
- Log:         Octopuss/shared/_sync/sync.log
- Schedule:    ~/Library/LaunchAgents/com.octopuss.memorysync.plist

## Check it is working
- Open sync.log and look for recent "PUSH ok" or "OK nothing to commit" lines.

## Run it by hand any time
- bash "Octopuss/shared/_sync/octopuss-sync.sh"

Machine label on this Mac: MBA. On the Mac Mini set MACHINE=MM in the script.
