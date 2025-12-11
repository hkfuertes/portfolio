role = "Senior Backend Developer - Tech Lead"
stack = ["Elixir", "Kafka", "PostgreSQL", "AWS", "EKS", "S3", "CloudFront"]
[project_led_1, project_led_2] = [%{
  name: "Sitemaps Generator",
  description: "Generate sitemaps for capterra.com based on SEO rules",
},
%{
  name: "Similarity Crawler",
  description: "Compare page similarity for SEO optimization",
}]
Jason.encode!({stack, [project_led_1, project_led_2]})
|> then(&:brod.produce_sync(:capterra_client, "capterra-tasks", &1))
