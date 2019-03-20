import React from 'react'

interface AddRatingQuestionProps{
    rating_question_url: string
}

class AddRatingQuestion extends React.Component<AddRatingQuestionProps> {
    titleRef = React.createRef();

createQuestion = (event) => {
    event.preventDefault();
    console.log("create a question")
}

    render() {
        return(
            <form 
            action = {this.props.rating_question_url}
            className="add-question" onSubmit={this.createQuestion}>
                <input name="title" type="text" placeholder="Question" />
                <button type="Submit">Add a question</button>
            </form>
        );
    }
}

export default AddRatingQuestion;