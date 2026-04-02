# InfraTales Public Release Checklist

Use this checklist before making any repository public.

## Identity

- [ ] Repository type declared in README
- [ ] Status declared in README
- [ ] Problem statement is clear
- [ ] Intended audience is clear
- [ ] Scope and non-goals are stated

## Honesty

- [ ] No unsupported production claims
- [ ] No unsupported performance claims
- [ ] No unsupported cost claims
- [ ] No unsupported reliability or security claims
- [ ] Any strong claims include evidence or limitations

## First-run verification

- [ ] Clone path verified
- [ ] Install path verified
- [ ] Build path verified
- [ ] Lint path verified
- [ ] Test path verified
- [ ] Validation or synth path verified
- [ ] Example usage or deployment path verified if advertised

## Documentation

- [ ] README matches actual repo state
- [ ] All commands were re-run recently
- [ ] All URLs point to the correct repo and org
- [ ] Package metadata points to the correct repo
- [ ] No placeholder text remains
- [ ] No drafting markers remain

## Governance and hygiene

- [ ] LICENSE present and consistent with README
- [ ] CONTRIBUTING.md present
- [ ] SECURITY.md present
- [ ] CODE_OF_CONDUCT.md present or inherited clearly
- [ ] .gitignore present
- [ ] Issue and PR templates added if contribution is invited

## Security

- [ ] No secrets or sensitive data committed
- [ ] Example env file used where needed
- [ ] Unsafe defaults documented clearly
- [ ] Security notes are specific to the implementation

## Maintenance

- [ ] Repository status is honest
- [ ] Support scope is defined
- [ ] Last verified date added where appropriate
- [ ] Changelog or release strategy defined where appropriate

## Final gate

- [ ] Repo review score is 85 or above
- [ ] A second reviewer has checked the repo
- [ ] Repo is something a stranger can trust without contacting the author

If any critical item fails, the repository stays private, gets archived, or is reclassified.
