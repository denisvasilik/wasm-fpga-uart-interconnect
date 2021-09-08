import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

__tag__ = ""
__build__ = 0
__version__ = "{}".format(__tag__)
__commit__ = "0000000"

setuptools.setup(
    name="wasm-fpga-uart-interconnect",
    version=__version__,
    author="Denis Vasilìk",
    author_email="contact@denisvasilik.com",
    url="https://github.com/denisvasilik/wasm-fpga-uart-interconnect/",
    project_urls={
        "Bug Tracker": "https://github.com/denisvasilik/wasm-fpga/",
        "Documentation": "https://wasm-fpga.readthedocs.io/en/latest/",
        "Source Code": "https://github.com/denisvasilik/wasm-fpga-uart-interconnect/",
    },
    description="WebAssembly FPGA Interconnect",
    long_description=long_description,
    long_description_content_type="text/markdown",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3.6",
        "Operating System :: OS Independent",
    ],
    dependency_links=[],
    package_dir={},
    package_data={},
    data_files=[
        ("wasm-fpga-uart-interconnect/package", ["package/component.xml"]),
        ("wasm-fpga-uart-interconnect/package/bd", ["package/bd/bd.tcl"]),
        ("wasm-fpga-uart-interconnect/package/xgui", ["package/xgui/wasm_fpga_uart_interconnect_v1_0.tcl"]),
        ("wasm-fpga-uart-interconnect/src", ["src/WasmFpgaInterconnect.vhd"]),
        (
            "wasm-fpga-uart-interconnect/tb",
            [
                "tb/tb_FileIo.vhd",
                "tb/tb_pkg_helper.vhd",
                "tb/tb_pkg.vhd",
                "tb/tb_std_logic_1164_additions.vhd",
                "tb/tb_Types.vhd",
                "tb/tb_WasmFpgaInterconnect.vhd",
            ],
        ),
        ("wasm-fpga-uart-interconnect", ["CHANGELOG.md", "AUTHORS", "LICENSE"]),
    ],
    setup_requires=[],
    install_requires=[],
    entry_points={},
)
