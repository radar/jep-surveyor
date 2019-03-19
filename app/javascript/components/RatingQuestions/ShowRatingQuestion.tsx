import * as React from 'react'

interface Question {
    title: string,
    id: string
}

interface ShowRatingQuestionProps {
    question: Question
}

class ShowRatingQuestion extends React.Component<ShowRatingQuestionProps> {
    render() {
        return(
            <div>{this.props.question.title}</div>
        )
    }
}

export default ShowRatingQuestion