class Page < ApplicationRecord

  # include Concerns::ActiveadminAncestryView::ModelMethods
	has_ancestry :cache_depth=> true
end
