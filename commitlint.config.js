// Commitlint configuration for InfraTales
// Enforces conventional commit messages
// https://www.conventionalcommits.org/

module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    // Type must be one of these
    'type-enum': [
      2,
      'always',
      [
        'feat',     // New feature
        'fix',      // Bug fix
        'docs',     // Documentation
        'style',    // Formatting, no code change
        'refactor', // Code refactoring
        'perf',     // Performance improvement
        'test',     // Adding tests
        'chore',    // Maintenance
        'ci',       // CI/CD changes
        'deps',     // Dependency updates
        'revert',   // Revert previous commit
        'security', // Security fixes
      ],
    ],
    // Type must be lowercase
    'type-case': [2, 'always', 'lower-case'],
    // Subject must not be empty
    'subject-empty': [2, 'never'],
    // Subject must not end with period
    'subject-full-stop': [2, 'never', '.'],
    // Subject max length
    'subject-max-length': [2, 'always', 72],
    // Body max line length
    'body-max-line-length': [2, 'always', 100],
    // Header max length
    'header-max-length': [2, 'always', 100],
  },
};
