# Contributing to Elyan Labs Site

Thank you for your interest in contributing to the Elyan Labs Site! This document provides guidelines and instructions for contributing to this project.

## Code of Conduct

By participating in this project, you agree to abide by our Code of Conduct. Please read it before contributing.

## Getting Started

### Prerequisites
- Basic understanding of HTML, CSS, and JavaScript
- Git installed on your machine
- A GitHub account

### Development Setup

1. **Fork the repository**
   ```bash
   # Fork the repository on GitHub
   # Then clone your fork locally
   git clone https://github.com/YOUR_USERNAME/elyan-labs-site.git
   cd elyan-labs-site
   ```

2. **Set up upstream remote**
   ```bash
   git remote add upstream https://github.com/Scottcjn/elyan-labs-site.git
   ```

3. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

## How to Contribute

### Reporting Bugs

When reporting bugs, please include:

1. A clear, descriptive title
2. Steps to reproduce the issue
3. Expected behavior vs actual behavior
4. Screenshots if applicable
5. Your environment (browser, OS, etc.)

### Suggesting Features

Feature suggestions are welcome! Please provide:

1. A clear description of the feature
2. The problem it solves
3. Examples of how it would be used
4. Any design considerations

### Pull Requests

1. **Keep changes focused**
   - Each PR should address a single issue or feature
   - Keep PRs small and manageable

2. **Follow coding standards**
   - Use consistent formatting
   - Add comments for complex logic
   - Update documentation as needed

3. **Test your changes**
   - Test in multiple browsers if applicable
   - Ensure no existing functionality is broken

4. **Update documentation**
   - Update README.md if adding new features
   - Add comments to code when necessary

## Coding Standards

### HTML
- Use semantic HTML5 elements
- Include proper meta tags
- Ensure accessibility (alt tags, ARIA labels)
- Validate with HTML validators

### CSS
- Use BEM naming convention for CSS classes
- Organize CSS with comments
- Use CSS variables for theming
- Ensure responsive design

### JavaScript
- Use ES6+ features when possible
- Follow consistent naming conventions
- Add JSDoc comments for functions
- Handle errors appropriately

### File Structure
```
elyan-labs-site/
├── index.html          # Main entry point
├── README.md          # Project documentation
├── CONTRIBUTING.md    # This file
├── LICENSE           # License information
├── config.json       # Configuration
├── scripts.js        # JavaScript utilities
├── styles.css        # CSS styles
└── hello-world.html  # Example page
```

## Commit Guidelines

### Commit Message Format
Use the following format for commit messages:

```
type(scope): description

[optional body]

[optional footer]
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

### Examples
```
feat(ui): add dark mode toggle
fix(nav): correct mobile navigation bug
docs(readme): update installation instructions
```

## Review Process

1. **Pull Request Submission**
   - Submit PR against the `main` branch
   - Ensure all checks pass
   - Request review from maintainers

2. **Code Review**
   - Address review comments promptly
   - Make requested changes
   - Keep the conversation constructive

3. **Merge**
   - PRs require at least one approval
   - Squash commits when appropriate
   - Delete the feature branch after merge

## Bounty Tasks

This project includes bounty tasks for specific features and fixes.

### Payment Information
For bounty task submissions, please include the following payment addresses in your PR:

**ERC20**: `0xB3ff5422f49324FD99a0AB7905440C9586d99999`

**TRC20**: `TGPZ5ozM1LLxXyErA45hKfcuR2cF7ntcsk`

### Bounty Guidelines
- Clearly reference the bounty issue number
- Ensure the task requirements are fully met
- Include payment addresses in PR description
- Follow all coding and contribution guidelines

## Getting Help

- Check the [README.md](README.md) for basic documentation
- Open an issue for questions or problems
- Join our community discussions

## License

By contributing to this project, you agree that your contributions will be licensed under the project's [MIT License](LICENSE).

## Acknowledgments

- Thank you to all our contributors
- Special thanks to bounty hunters for their valuable contributions
- The Elyan Labs community for support and feedback

---

*This CONTRIBUTING.md file was created as part of a bounty task. Payment address: ERC20: 0xB3ff5422f49324FD99a0AB7905440C9586d99999 or TRC20: TGPZ5ozM1LLxXyErA45hKfcuR2cF7ntcsk*