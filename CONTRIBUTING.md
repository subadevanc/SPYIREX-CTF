# Contributing to SPYIREX-CTF Write-ups

Thank you for your interest in contributing to the SPYIREX-CTF write-ups repository! This document provides guidelines for contributing.

## How to Contribute

### Adding New Write-ups

1. **Fork the Repository**
   ```bash
   git clone https://github.com/subadevanc/SPYIREX-CTF.git
   cd SPYIREX-CTF
   ```

2. **Create a New Branch**
   ```bash
   git checkout -b writeup/challenge-name
   ```

3. **Use the Template**
   - Copy `TEMPLATE.md` to the appropriate category folder
   - Rename it to match your challenge name (use kebab-case)
   - Fill in all sections

4. **Write Your Solution**
   - Be clear and detailed
   - Include step-by-step instructions
   - Add code snippets with proper syntax highlighting
   - Include screenshots if helpful (save images in same directory)

5. **Update Category README**
   - Add your challenge to the list in the category's README.md
   - Include difficulty and point value

6. **Commit Your Changes**
   ```bash
   git add .
   git commit -m "Add write-up for [Challenge Name]"
   ```

7. **Push and Create Pull Request**
   ```bash
   git push origin writeup/challenge-name
   ```
   Then open a Pull Request on GitHub

## Write-up Guidelines

### Structure

Each write-up should follow this structure:

1. **Header** - Challenge name, category, difficulty, points, author
2. **Description** - Original challenge description
3. **Solution** - Your complete solution with:
   - Initial Analysis
   - Approach
   - Step-by-step solution
   - Code/scripts used
   - Flag
4. **Key Takeaways** - What you learned

### Style Guide

- **Markdown**: Use proper Markdown formatting
- **Code Blocks**: Always specify the language for syntax highlighting
  ```python
  # Good
  print("Hello")
  ```
- **Flags**: Always use code blocks for flags
  ```
  JCE{example_flag}
  ```
- **Commands**: Show terminal commands with bash code blocks
  ```bash
  ls -la
  ```
- **Headings**: Use proper heading hierarchy (##, ###, ####)
- **Lists**: Use bullet points or numbered lists for steps

### Content Guidelines

#### Do's ✅

- Explain your thought process
- Include all relevant commands and outputs
- Mention tools and versions used
- Add educational value with key takeaways
- Credit any resources or references used
- Test your steps to ensure they work
- Use clear, concise language

#### Don'ts ❌

- Don't skip important steps
- Don't assume too much prior knowledge
- Don't include unnecessary information
- Don't plagiarize other write-ups
- Don't post write-ups during active CTF competitions
- Don't reveal flags for ongoing challenges

### Code Quality

- Format code properly with indentation
- Add comments to complex code sections
- Test all scripts before submitting
- Include required dependencies/imports
- Use meaningful variable names

### Example Structure

```markdown
# Challenge Name

**Category:** Web
**Difficulty:** Medium
**Points:** 250
**Author:** Your Name

## Description

The original challenge description goes here.

## Solution

### Initial Analysis

What did you notice first? What tools did you use?

### Approach

Explain your strategy for solving the challenge.

### Steps to Solve

1. First step with explanation
2. Second step with command example
   ```bash
   command --flag argument
   ```
3. Third step showing output
   ```
   output text
   ```

### Code/Scripts Used

```python
#!/usr/bin/env python3
# Script description

def solve():
    # Your code here
    pass
```

### Flag

```
JCE{your_flag_here}
```

## Key Takeaways

- What you learned
- Techniques used
- Tools discovered
- Common mistakes to avoid
```

## Review Process

All pull requests will be reviewed for:

1. **Completeness** - All template sections filled out
2. **Accuracy** - Solution is correct and reproducible
3. **Clarity** - Explanation is clear and easy to follow
4. **Formatting** - Proper Markdown and code formatting
5. **Style** - Follows the style guide

## Questions?

If you have questions about contributing, please:

- Open an issue on GitHub
- Check existing write-ups for examples
- Review the TEMPLATE.md file

Thank you for contributing to SPYIREX-CTF write-ups!
