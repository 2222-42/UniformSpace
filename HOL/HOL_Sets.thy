theory HOL_Sets
  imports Main (*"~~/src/HOL/Lattices"*)
begin


definition Ball :: "'a set \<Rightarrow> ('a \<Rightarrow> bool) \<Rightarrow> bool"
  where "Ball A P \<longleftrightarrow> (\<forall>x. x \<in> A \<longrightarrow> P x)"

end