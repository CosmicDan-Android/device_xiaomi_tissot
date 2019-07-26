#
# Copyright 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file is executed by build/envsetup.sh, and can use anything
# defined in envsetup.sh.
#
# In particular, you can add lunch options with the add_lunch_combo
# function: add_lunch_combo generic-eng

for var in eng user userdebug; do
  add_lunch_combo omni_tissot-$var
done

make_twrp_tissot() {
	echo ""
	echo "> export ALLOW_MISSING_DEPENDENCIES=true; lunch omni_tissot-eng"
	export ALLOW_MISSING_DEPENDENCIES=true; lunch omni_tissot-eng
	echo "> mka recoveryimage $@"
    mka recoveryimage "$@"
	echo ""
	# TODO: rename recovery.img?
	echo ""
	echo "[i] All done!"
}

echo ""
echo "~~~~~~~~~~~~"
echo "[i] To build TWRP + Tissot Manager (Treble support, dualboot, etc), run \`make_twrp_tissot [-j#]\`."
echo "~~~~~~~~~~~~"
echo ""