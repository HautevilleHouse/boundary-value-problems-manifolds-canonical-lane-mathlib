import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure EllipticOperatorPackage where
  manifoldType : Type u
  vectorBundle : Type v
  symbolHomotopy : Prop
  fredholmProperty : Prop
  indexFormula : Prop

structure EllipticOperatorEvidence (E : EllipticOperatorPackage) where
  symbolHomotopyClosed : E.symbolHomotopy
  fredholmPropertyClosed : E.fredholmProperty
  indexFormulaClosed : E.indexFormula

def EllipticOperatorClosed (E : EllipticOperatorPackage) : Prop :=
  E.symbolHomotopy ∧ E.fredholmProperty ∧ E.indexFormula

theorem elliptic_operator_closed_from_evidence (E : EllipticOperatorPackage)
    (Ev : EllipticOperatorEvidence E) : EllipticOperatorClosed E := by
  exact And.intro Ev.symbolHomotopyClosed (And.intro Ev.fredholmPropertyClosed Ev.indexFormulaClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse
