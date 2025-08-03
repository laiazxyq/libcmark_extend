#!/bin/sh

# Usage:
#     Update to the latest cmark-gfm version:
#         ./update_cmark_gfm.sh
#     Update to the specified cmark-gfm commit:
#         ./update_cmark_gfm.sh [commit]

# Clear cmark directory
rm Sources/libcmark_extend
# Clone cmark-gfm and checkout a commit if specified
git clone https://github.com/github/cmark-gfm.git
cd cmark-gfm
git checkout 0.29.0.gfm.13


cd ../
# Copy source files
mkdir -p Sources/libcmark_extend/include/
mkdir -p Sources/libcmark_extend/src/

cp cmark-gfm/src/*.{inc,h} Sources/libcmark_extend/include/
cp cmark-gfm/src/*.c Sources/libcmark_extend/src/
cp cmark-gfm/extensions/*.h Sources/libcmark_extend/include/
cp cmark-gfm/extensions/*.c Sources/libcmark_extend/src/

# # Delete `main.c` because it causes issues
rm Sources/libcmark_extend/src/main.c

# # Create generated files
mkdir cmark-gfm/build
cd cmark-gfm/build
cmake .. -DCMAKE_POLICY_VERSION_MINIMUM=3.5
cd ../..

# # Copy generated files
cp cmark-gfm/build/src/*.h Sources/libcmark_extend/include
# cp cmark-gfm/build/extensions/*.h Sources/CMarkGFM

# # Clean up
rm -rf cmark-gfm