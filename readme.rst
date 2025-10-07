A biologically-inspired foveated interface for deep vision models
=================================================================

Welcome to the ``foveation`` code-base, a PyTorch library for
implementing foveated vision. This library provides tools for retinal
sampling, cortical mapping, and foveated neural network architectures.

🛠️ Install
----------

First, create a fresh conda environment:

::

      conda create -n foveation
      conda activate foveation
      conda install pip

To download pretrained models from our repo, you will need ``git lfs``,
which is used for “large file storage”. Then clone the repo and enter
it:

::

   conda install git-lfs
   git clone https://github.com/nblauch/foveation-private.git
   cd foveation-private

Now, for installing our package. The easiest installation is without
``ffcv``. This will allow you to use everything in our code-base except
the training functionality. If you want training functionality with
``ffcv``, see below. You could also use your own training scripts with
our models.

For the easy install, just do

::

   conda create -n foveation
   conda install pip
   # from within the foveation-private repo
   pip install -e . # this will automatically install foveation/requirements.txt

To install with ``ffcv`` to allow fast training, first follow the
instructions to install ``ffcv-ssl``, which has stricter requirements,
and then install ``foveation`` and its requirements.

::

   conda install python=3.9 cupy pkg-config compilers libjpeg-turbo opencv pytorch torchvision torchaudio pytorch-cuda numba -c pytorch -c nvidia -c conda-forge
   pip install git+https://github.com/facebookresearch/FFCV-SSL.git
   # from within the foveation repo
   pip install -e .

For VisionLab researchers, the easiest thing to do for ``ffcv`` support
on the ``FASRC`` cluster is to clone your ``workshop`` environment, and
then install ``foveation`` into it.

::

   conda create --name foveation --clone workshop
   # from within the foveation repo
   pip install -e .

📝 Example notebooks
--------------------

(if viewing the docs, see “Getting Started/Example notebooks” on the
left).

``notebooks/step0_sensor_manifold`` : explore the basic concepts
involved in our foveated sensor

``notebooks/step1_sampling.ipynb`` : learn how to do foveated sampling
from images

``notebooks/step2_knnconv.ipynb`` : learn how to build kNN-convolutional
neural networks to process foveated sensor outputs

``notebooks/step3_dinov3.ipynb`` : work with a state-of-the-art foveated
vision system based on the DINOv3 ViT model, adapted to handle foveated
inputs.

📚 Documentation
----------------

Comprehensive documentation is automatically generated from the source
code and docstrings. The documentation includes:

- **API Reference**: Complete documentation of all functions, classes,
  and modules
- **User Guide**: Installation, quickstart, and usage examples
- **Developer Guide**: Contributing guidelines and development setup

.. code:: bash

   # Install documentation dependencies
   pip install -r requirements-docs.txt

   # Generate documentation
   python scripts/generate_docs.py

   # View the documentation
   open docs/_build/html/index.html

   # View documentation on a remote cluster (need to forward the port separately, this is done automatically in VScode/Cursor)
   python -m http.server 8000 --directory docs/_build/html

🏛️ Citation
-----------

Blauch, N.M., Alvarez, G.A., Konkle, T. (2025). A biologically-inspired
foveated interface for deep vision models. arXiv.
