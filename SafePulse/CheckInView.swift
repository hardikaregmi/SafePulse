//
//  CheckInView.swift
//  SafePulse
//
//  Created by Hardika Regmi on 5/1/26.
//

import SwiftUI

struct CheckInView: View {
    @State private var selectedFeeling = ""

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.white, Color.purple.opacity(0.10)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 22) {
                    Text("Emotional Check-In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)

                    Text("How are you feeling right now?")
                        .font(.headline)
                        .foregroundColor(.gray)

                    VStack(spacing: 14) {
                        feelingButton("Calm")
                        feelingButton("Anxious")
                        feelingButton("Unsafe")
                        feelingButton("Need Support")
                    }

                    if !selectedFeeling.isEmpty {
                        VStack(spacing: 10) {
                            Text("You selected: \(selectedFeeling)")
                                .font(.headline)
                                .foregroundColor(.green)

                            Text(responseMessage)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)

                            if selectedFeeling == "Need Support" {
                                VStack(spacing: 12) {
                                    Link("Call 988 Support Line", destination: URL(string: "tel://988")!)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.purple)
                                        .cornerRadius(16)

                                    NavigationLink(destination: SupportSpaceView()) {
                                        Text("Open Support Space")
                                            .font(.headline)
                                            .foregroundColor(.purple)
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(Color.white)
                                            .cornerRadius(16)
                                            .shadow(color: .black.opacity(0.08), radius: 4)
                                    }
                                }
                                .padding(.top, 10)
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.75))
                        .cornerRadius(18)
                        .shadow(color: .black.opacity(0.06), radius: 4)
                        .padding(.top, 10)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .padding(.bottom, 30)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                EmptyView()
            }
        }
    }

    var responseMessage: String {
        switch selectedFeeling {
        case "Calm":
            return "That is good to hear. Keep checking in with yourself."
        case "Anxious":
            return "Take a slow breath. You can pause, breathe, and reach out if needed."
        case "Unsafe":
            return "If you feel unsafe, move to a safer place and contact someone you trust."
        case "Need Support":
            return "You are not alone. You can call support or open the support space below."
        default:
            return "Take a breath. You are not alone."
        }
    }

    func feelingButton(_ title: String) -> some View {
        Button(title) {
            selectedFeeling = title
        }
        .font(.headline)
        .foregroundColor(.purple)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.08), radius: 4)
    }
}

#Preview {
    NavigationStack {
        CheckInView()
    }
}
