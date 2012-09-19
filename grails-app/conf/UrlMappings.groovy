class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/users"{
            controller = "user"
            action = "list"
        }

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
