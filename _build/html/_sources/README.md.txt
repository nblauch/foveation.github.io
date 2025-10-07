# Foveation Documentation

This directory contains the documentation for the Foveation project. The documentation is built using Sphinx and automatically generates API documentation from the source code and docstrings.

## Quick Start

1. **Install documentation dependencies:**
   ```bash
   pip install -r requirements-docs.txt
   ```

2. **Generate documentation:**
   ```bash
   python scripts/generate_docs.py
   ```

3. **View documentation:**
   ```bash
   python scripts/generate_docs.py --open
   ```

## Manual Build

If you prefer to build manually:

```bash
cd docs
make clean
make html
```

## Documentation Structure

- **API Reference**: Automatically generated from source code docstrings
- **User Guide**: Manual documentation for users
- **Examples**: Code examples and tutorials
- **Installation**: Setup instructions

## Adding Documentation

### For Code Documentation

1. **Write good docstrings** in your Python code using Google or NumPy style:
   ```python
   def my_function(param1: str, param2: int) -> bool:
       """Short description of the function.
       
       Longer description if needed.
       
       Args:
           param1: Description of param1
           param2: Description of param2
           
       Returns:
           Description of return value
           
       Raises:
           ValueError: When something goes wrong
       """
       pass
   ```

2. **For classes**, document the `__init__` method:
   ```python
   class MyClass:
       """Short description of the class.
       
       Longer description if needed.
       """
       
       def __init__(self, param: str):
           """Initialize the class.
           
           Args:
               param: Description of the parameter
           """
           self.param = param
   ```

### For Manual Documentation

1. **Add new RST files** in the appropriate directory
2. **Update the toctree** in the relevant index.rst file
3. **Rebuild the documentation**

## Configuration

The documentation is configured in `conf.py`. Key settings:

- **Extensions**: Sphinx extensions for autodoc, napoleon, etc.
- **Theme**: Read the Docs theme
- **Autodoc settings**: Configure how docstrings are processed
- **Intersphinx**: Links to external documentation (Python, PyTorch, NumPy)

## Troubleshooting

### Common Issues

1. **Import errors**: Make sure the project root is in the Python path
2. **Missing modules**: Check that all modules are properly imported in `__init__.py`
3. **Build errors**: Clean the build directory and try again

### Debugging

To see detailed build information:
```bash
cd docs
make html SPHINXOPTS="-v"
```

## Contributing

When contributing to the documentation:

1. Follow the existing style and format
2. Test your changes by rebuilding the documentation
3. Ensure all links work correctly
4. Update the toctree if adding new pages 