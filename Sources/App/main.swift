import Vapor

func routes(_ app: Application) throws {
    app.get("ping") { _ in
        "pong"
    }

    app.get("stories") { _ -> [String] in
        return ["Golden Gate Bridge", "Alcatraz Island"]
    }
}

let app = Application()
defer { app.shutdown() }

app.http.server.configuration.hostname = "0.0.0.0"

try routes(app)
try app.run()
