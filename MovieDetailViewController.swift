import UIKit
import AVKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - UI Components
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let posterImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        // Placeholder image URL
        if let url = URL(string: "https://source.unsplash.com/random/400x600?movie") {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        iv.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("▶ Play", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("⬇ Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .black
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [posterImageView, titleLabel, descriptionLabel, playButton, downloadButton].forEach {
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 400),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            playButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            
            downloadButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 16),
            downloadButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            downloadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            downloadButton.heightAnchor.constraint(equalToConstant: 50),
            downloadButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        // Sample data
        titleLabel.text = "Sample Movie Title"
        descriptionLabel.text = "This is a sample movie description. It tells the story of an amazing adventure that will keep you on the edge of your seat. Watch as the characters navigate through challenges and discover themselves along the way."
    }
    
    private func setupActions() {
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        downloadButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func playButtonTapped() {
        // For demo purposes, we'll just show an alert
        let alert = UIAlertController(title: "Playing Movie", message: "This would start playing the movie in a real app", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func downloadButtonTapped() {
        // For demo purposes, we'll just show an alert
        let alert = UIAlertController(title: "Downloading", message: "This would start downloading the movie in a real app", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}