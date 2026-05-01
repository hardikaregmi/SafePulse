//
//  SupportSpaceView.swift
//  SafePulse
//
//  Created by Hardika Regmi on 5/1/26.
//
import SwiftUI

struct SupportSpaceView: View {
    @State private var newPost = ""
    @State private var posts = [
        "You are not alone. Sometimes reaching out is the first step to feeling safe.",
        "Take a deep breath. Your feelings are valid, and support is always important.",
        "If you feel unsafe or overwhelmed, contact someone you trust."
    ]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.white, Color.purple.opacity(0.10)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("Support Space")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)

                    Text("A calm space for users to share thoughts, encouragement, and safety reminders.")
                        .foregroundColor(.gray)

                    VStack(spacing: 12) {
                        TextField("Write a short supportive post...", text: $newPost)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: .black.opacity(0.06), radius: 4)

                        Button("Post") {
                            let trimmed = newPost.trimmingCharacters(in: .whitespacesAndNewlines)

                            if !trimmed.isEmpty {
                                posts.insert(trimmed, at: 0)
                                newPost = ""
                            }
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(16)
                    }

                    Text("Community Posts")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                        .padding(.top, 10)

                    ForEach(posts, id: \.self) { post in
                        Text(post)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: .black.opacity(0.06), radius: 4)
                    }
                }
                .padding(24)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                EmptyView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        SupportSpaceView()
    }
}
