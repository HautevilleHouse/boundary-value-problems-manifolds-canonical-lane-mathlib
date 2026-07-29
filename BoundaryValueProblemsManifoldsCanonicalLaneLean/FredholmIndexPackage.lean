import BoundaryValueProblemsManifoldsCanonicalLaneLean.EllipticOperatorPackage

/-!
# Fredholm Index Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure FredholmIndexPackage {E : EllipticOperatorPackage} where
  indexType : Type u
  indexValue : ℤ
  indexComputed : Prop
  indexComputedClosed : indexComputed

def FredholmIndexClosed {E : EllipticOperatorPackage} (F : FredholmIndexPackage E) : Prop :=
  F.indexComputed

structure FredholmIndexEvidence {E : EllipticOperatorPackage} (F : FredholmIndexPackage E) where
  indexComputedTerm : F.indexComputed

theorem fredholm_index_closed_from_evidence {E : EllipticOperatorPackage}
    (F : FredholmIndexPackage E) (ev : FredholmIndexEvidence F) :
    FredholmIndexClosed F := by
  exact ev.indexComputedTerm

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse
