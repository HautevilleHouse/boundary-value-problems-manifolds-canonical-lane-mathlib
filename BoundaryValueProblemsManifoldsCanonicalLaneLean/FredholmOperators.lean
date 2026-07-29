import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure FredholmPackage {G : RiemannianCurvaturePackage} {B : BoundaryValueManifoldPackage G} (R : EllipticRegularityPackage B) where
  indexTheorem : Prop
  kernelFiniteDimensional : Prop
  cokernelFiniteDimensional : Prop

def FredholmClosed {G : RiemannianCurvaturePackage} {B : BoundaryValueManifoldPackage G} {R : EllipticRegularityPackage B} (F : FredholmPackage R) : Prop :=
  F.indexTheorem ∧ F.kernelFiniteDimensional ∧ F.cokernelFiniteDimensional

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse