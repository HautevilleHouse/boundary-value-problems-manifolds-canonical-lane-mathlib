import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure ManifoldWithBoundaryPackage where
  M : Type u
  ∂M : Type v
  metric : Type w
  smoothStructure : Prop
  riemannianMetric : Prop
  dimension : Nat
  boundaryDimension : Nat
  compact : Prop
  orientation : Prop

default

structure ManifoldWithBoundaryEvidence (P : ManifoldWithBoundaryPackage) where
  smoothStructureClosed : P.smoothStructure
  riemannianMetricClosed : P.riemannianMetric
  compactClosed : P.compact
  orientationClosed : P.orientation

def ManifoldWithBoundaryClosed (P : ManifoldWithBoundaryPackage) : Prop :=
  P.smoothStructure ∧ P.riemannianMetric ∧ P.compact ∧ P.orientation

theorem manifold_with_boundary_closed_from_evidence
    (P : ManifoldWithBoundaryPackage) (E : ManifoldWithBoundaryEvidence P) :
    ManifoldWithBoundaryClosed P := by
  exact And.intro E.smoothStructureClosed
    (And.intro E.riemannianMetricClosed
      (And.intro E.compactClosed E.orientationClosed))

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse
