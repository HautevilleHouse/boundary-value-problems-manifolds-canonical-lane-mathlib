import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure LaplaceBeltramiPackage where
  manifold : Type u
  metric : Type v
  operatorDefined : Prop
  ellipticity : Prop
  selfAdjointness : Prop

structure LaplaceBeltramiEvidence (L : LaplaceBeltramiPackage) where
  operatorDefinedClosed : L.operatorDefined
  ellipticityClosed : L.ellipticity
  selfAdjointnessClosed : L.selfAdjointness

def LaplaceBeltramiClosed (L : LaplaceBeltramiPackage) : Prop :=
  L.operatorDefined ∧ L.ellipticity ∧ L.selfAdjointness

theorem laplace_beltrami_closed_from_evidence (L : LaplaceBeltramiPackage) (E : LaplaceBeltramiEvidence L) :
    LaplaceBeltramiClosed L := by
  exact And.intro E.operatorDefinedClosed (And.intro E.ellipticityClosed E.selfAdjointnessClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse
