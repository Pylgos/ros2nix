final: prev: {
  rosPackages = prev.rosPackages.overrideScope (rosFinal: rosPrev: {
    ament_cmake_vendor_package = rosPrev.ament_cmake_vendor_package.overrideAttrs ({ patches ? [], propagatedBuildInputs ? [], ...}: {
      propagatedBuildInputs = propagatedBuildInputs ++ [
        final.git
      ];
      patches = patches ++ [
        ./ament_vendor.patch
      ];
    });
  });
}