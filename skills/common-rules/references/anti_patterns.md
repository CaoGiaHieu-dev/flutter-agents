# Anti-Pattern Dictionary & Cleanup Reference

This file contains detailed anti-pattern examples and their
fixes. Referenced by `common-rules` SKILL.md.

---

## Magic Numbers

```
BAD:  if (status == 200) { ... }
GOOD: const int httpOk = 200;
      if (status == httpOk) { ... }
```

## Nested Callbacks (> 2 levels)

```
BAD:  api.get().then((data) {
        process(data).then((result) {
          save(result).then((ok) { ... })
        })
      })
GOOD: final data = await api.get();
      final result = await process(data);
      await save(result);
```

## Unused Imports

```
BAD:  import 'dart:async'; // never referenced
GOOD: Remove the line entirely.
```

## God Widget (> 200 lines)

```
BAD:  class HomePage extends StatefulWidget {
        // 450 lines of mixed UI + logic
      }
GOOD: Extract into composition:
      - HomePageAppBar (widget)
      - HomePageContent (widget)
      - HomePageFooter (widget)
      - HomePage (composes the above, ~50 lines)
```

## Hardcoded Strings

```
BAD:  Text('Welcome, User!')
GOOD: Text(AppStrings.welcomeUser)
      // or use l10n: Text(context.l10n.welcomeUser)
```

## Missing Null Safety

```
BAD:  user.profile.name  // can throw
GOOD: user?.profile?.name ?? 'Unknown'
      // or use Either<Failure, String>
```

## Unused Variables

```
BAD:  final result = compute();
      print('done'); // result never used
GOOD: compute(); // if return value unneeded
      // or: final _ = compute(); // intentional
```

## Missing Error Handling

```
BAD:  final data = await api.fetch();
      update(data);
GOOD: try {
        final data = await api.fetch();
        update(data);
      } catch (e) {
        handleError(e);
      }
```

---

## Cleanup Report Template

After bulk cleanup, generate this report:

```markdown
## Code Cleanup Report
Generated: <date> | Skill: <skill_name>

### Issues Fixed
- ✅ Removed N unused imports
- ✅ Extracted N magic numbers to constants
- ✅ Split <FileName> (N LOC) → M files

### Metrics Improvement
| Metric           | Before | After | Change |
|------------------|--------|-------|--------|
| Avg Func Length  | X LOC  | Y LOC | ↓Z%    |
| Max Nesting      | X      | Y     | ↓Z%    |
| Unused Variables | X      | 0     | ✅     |

### Grade: A/B/C/BLOCK
```
