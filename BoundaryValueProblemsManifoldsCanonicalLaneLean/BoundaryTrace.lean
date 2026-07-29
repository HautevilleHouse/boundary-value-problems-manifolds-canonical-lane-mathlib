import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure TraceOperator (M : ManifoldWithBoundary) where
  traceMap : Type
  continuity : Prop
  surjectivity : Prop
  rightInverse : Prop

structure TraceEvidence {M : ManifoldWithBoundary} (T : TraceOperator M) where
  continuityClosed : T.continuity
  surjectivityClosed : T.surjectivity
  rightInverseClosed : T.rightInverse

def TraceClosed {M : ManifoldWithBoundary} (T : TraceOperator M) : Prop :=
  T.continuity ∧ T.surjectivity ∧ T.rightInverse

theorem trace_closed_from_evidence {M : ManifoldWithBoundary} (T : TraceOperator M) (E : TraceEvidence T) : TraceClosed T := by
  exact And.intro E.continuityClosed (And.intro E.surjectivityClosed E.rightInverseClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse
