import SwiftUI

struct ContactsView: View {
    @State private var contacts: [Contact] = []
    @State private var name = ""
    @State private var phone = ""

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.white, Color.purple.opacity(0.08)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    Text("Emergency Contacts")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)

                    VStack(alignment: .leading, spacing: 14) {
                        Text("Add Emergency Contact")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)

                        TextField("Name", text: $name)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(14)
                            .shadow(color: .black.opacity(0.05), radius: 3)

                        TextField("Phone Number", text: $phone)
                            .keyboardType(.phonePad)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(14)
                            .shadow(color: .black.opacity(0.05), radius: 3)

                        Button(action: {
                            if !name.isEmpty && !phone.isEmpty {
                                let newContact = Contact(name: name, phone: phone)
                                contacts.append(newContact)
                                saveContacts()
                                name = ""
                                phone = ""
                            }
                        }) {
                            Text("Save Contact")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.purple)
                                .cornerRadius(16)
                        }
                    }

                    VStack(alignment: .leading, spacing: 14) {
                        Text("Saved Contacts")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.purple)

                        if contacts.isEmpty {
                            Text("No emergency contacts added yet.")
                                .foregroundColor(.gray)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(16)
                        } else {
                            ForEach(Array(contacts.enumerated()), id: \.element.id) { index, contact in
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(contact.name)
                                            .font(.headline)
                                            .foregroundColor(.primary)

                                        Text(contact.phone)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }

                                    Spacer()

                                    Button(action: {
                                        contacts.remove(at: index)
                                        saveContacts()
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                    }
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(16)
                                .shadow(color: .black.opacity(0.05), radius: 3)
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 10)
                .padding(.bottom, 30)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                EmptyView()
            }
        }
        .onAppear {
            loadContacts()
        }
    }

    func saveContacts() {
        if let encoded = try? JSONEncoder().encode(contacts) {
            UserDefaults.standard.set(encoded, forKey: "SavedContacts")
        }
    }

    func loadContacts() {
        if let data = UserDefaults.standard.data(forKey: "SavedContacts"),
           let decoded = try? JSONDecoder().decode([Contact].self, from: data) {
            contacts = decoded
        }
    }

    func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
        saveContacts()
    }
}

#Preview {
    NavigationStack {
        ContactsView()
    }
}
