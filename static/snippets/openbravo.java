String[] tasks = {"Client support", "Partner guidance", "Module dev"};
String stack = "Java + Tomcat + Hibernate + Oracle";

void supportClients() {
    clients.forEach(c -> resolveIssues(c));
    partners.forEach(p -> guideModules(p));
}
