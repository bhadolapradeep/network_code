# MultiNetComplex: A Python Package for Multiplex Network Analysis

[![PyPI version](https://badge.fury.io/py/multinetcomplex.svg)](https://badge.fury.io/py/multinetcomplex)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**MultiNetComplex** is a Python library designed for physicists, data scientists, and researchers working on complex systems. It provides a streamlined workflow for moving from raw time-series data to sophisticated single-layer and multiplex network analysis.

---

## Key Features

-   **Network Construction**: Build networks from correlation or adjacency data using various methods (`Threshold`, `MST`, `PMFG`).
-   **Robust Analysis**: A comprehensive suite of functions to calculate node-level (`centrality`, `core/periphery`) and network-level (`density`, `efficiency`, `radius`) properties.
-   **Multiplex Tools**: Analyze higher-order interactions with tools for multilink matrix generation and analysis.
-   **Dynamic & Comparative Analysis**: Compare networks across layers or time, and analyze system robustness through node perturbation.
-   **Integrated Workflow**: A high-level `SystemAnalyzer` class to run an entire end-to-end analysis pipeline with just a few lines of code.
-   **Publication-Ready Visualizations**: Built-in plotting functions using `pymnet` and `seaborn` to visualize multilayer networks, community structures, and comparative results.

## Installation

You can install MultiNetComplex via pip:

```bash
pip install multinetcomplex
```

## Quickstart: A 5-Minute Example

Here's how to go from a pandas DataFrame of time-series data to a full analysis.

```python
import pandas as pd
from multinet import SystemAnalyzer
from multinet.visualize import plot_community_network

# 1. Load your data (e.g., 20 variables over 300 time steps)
# For this example, we'll use a sample data generator
from multinet.utils import generate_random_timeseries
ts_data = generate_random_timeseries(num_nodes=20, num_timesteps=300)

# 2. Initialize and run the analysis workflow
analyzer = SystemAnalyzer(data=ts_data, data_type='timeseries')
analyzer.run_full_analysis(threshold=0.6)

# 3. Access the results
results = analyzer.get_results()
print("--- Single Layer Analysis ---")
print(results['single_layer_analysis'])

# 4. Visualize the network's community structure
from multinet.analysis import detect_communities

network = analyzer.networks # The constructed graph
communities = detect_communities(network)
plot_community_network(network, communities)
```

## Documentation

For full API references, tutorials, and theoretical background, please see our full documentation on [ReadTheDocs](https://your-rtd-link-here.readthedocs.io/).

## Contributing

We welcome contributions! Please see our `CONTRIBUTING.md` file for guidelines.

## License

This project is licensed under the MIT License.