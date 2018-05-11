rails generate model Search topic:references date_searched:date
rails generate model Topic name:string public:boolean
rails generate model Result url:string date_retrieved:date body:string author:string published_on:date
rails generate model Keyword word:string
rails generate model SearchTerm keyword:references search:references
rails generate model ResultKeyword keyword:references result:references
rails generate model SearchResult search:references result:references keep:boolean
rails generate model SupportingDoc result:references synth_content:references
rails generate model SynthContent topic:references content:string