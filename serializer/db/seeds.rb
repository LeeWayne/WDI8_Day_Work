ia = Author.create! first_name: 'Isaac', last_name: 'Asimov', email: 'ia@terminus.org', biography: 'Isaac Asimov was an American author and professor of biochemistry at Boston University, best known for his works of science fiction and for his popular science books.'

rah = Author.create! first_name: 'Robert', last_name: 'Heinlein', email: 'through_the_wall@the.cat.com', biography: "Robert Anson Heinlein was an American science fiction writer. Often called the 'dean of science fiction writers', he was one of the most influential and controversial authors of the genre in his time. He set a standard for scientific and engineering plausibility, and helped to raise the genre's standards of literary quality."

ns = Author.create! first_name: 'Neal', last_name: 'Stephenson', email: 'root@root.org', biography: "Neal Town Stephenson is an American author and game designer known for his works of speculative fiction. His novels have been variously categorized as science fiction, historical fiction, cyberpunk, and 'postcyberpunk.' Other labels, such as 'baroque,' often appear."

p1 = Post.create! author_id: ns.id, title: 'best day ever', content: "Ah, hell, Shepherd, I ain't looking for help from on high. That's a long wait for a train don't come.  Shepherd Book: Why when I talk about belief, why do you always assume I'm talking about God?"

p2 = Post.create! author_id: rah.id, title: "what's this all about", content: "Start with the part where Jayne gets knocked out by a 90-pound girl 'cause... I don't think that's ever getting old."

p3 = Post.create! author_id: ns.id, title: 'another post', content: "Secrets are not my concern. Keeping them is."

p4 = Post.create! author_id: ia.id, title: 'what about bob', content: "You came to the training house looking for a fight. Capt."

Comment.create! post_id: p1.id, first_name: 'dave', last_name: 'wilson', content: "that's awesome"

Comment.create! post_id: p2.id, first_name: 'dave', last_name: 'wilson', content: "I like this a lot"

Comment.create! post_id: p1.id, first_name: 'scotty', content: "lols"

Comment.create! post_id: p3.id, first_name: 'andrew', last_name: 'hicks', content: "like"

Comment.create! post_id: p1.id, first_name: 'simon', last_name: 'grey', content: "the same thing happened to me"

Comment.create! post_id: p3.id, first_name: 'donald', last_name: 'trump', content: "i'd buy that for a dollar"


